view: offline_campaign_attribution_old {
  derived_table: {
    sql: SELECT
        ROW_NUMBER() OVER() AS pk,
        orders.id AS order_id,
        offline_marketing.id AS offline_marketing_id,
        DATE(offline_marketing.date__c) AS offline_marketing_campaign_date,
        DATE(orders.createddate) AS order_created_date,
        offline_marketing.state__c AS state,
        offline_marketing.jv__c AS RevShare,



        coalesce(
                case
                  when date(offline_marketing.date__c) >= date(orders.createddate - interval {% parameter attribution_time_period %})
                    and date(offline_marketing.date__c) <= date(orders.createddate)
                    and offline_marketing.state__c = orders.state__c
                    and (orders.order_status__c = 'Exported' or orders.order_status__c = 'Confirmed' or orders.order_status__c = 'Ready For Export')
                  then 1
                  else 0
                end / cast(nullif(count(
                                        case
                                          when date(offline_marketing.date__c) >= date(orders.createddate - interval {% parameter attribution_time_period %})
                                            and date(offline_marketing.date__c) <= date(orders.createddate)
                                            and offline_marketing.state__c = orders.state__c
                                            and (orders.order_status__c = 'Exported' or orders.order_status__c = 'Confirmed' or orders.order_status__c = 'Ready For Export')
                                          then offline_marketing.id
                                          else null
                                        end
                                        ) over (partition by orders.id),0) as decimal(38,18))
                  ,0) as linear_attribution_weight

      FROM salesforce.marketing_spend__c AS offline_marketing
      LEFT JOIN salesforce.order__c AS orders
             ON orders.deal_id__c = offline_marketing.deal_id__c
    ;;
  }


# ----------------- DIMENSIONS ------------------------

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: number
  }

  dimension: order_id {
    type: number
  }

#   dimension: deal {}

  dimension: offline_marketing_id {
    type: number
  }

  dimension_group: offline_marketing_campaign {
    type: time
    datatype: date
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.offline_marketing_campaign_date ;;
  }

  dimension_group: orders_created {
    type: time
    datatype: date
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.order_created_date ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: linear_attribution_weight {
    hidden: yes
    type: number
    sql: ${TABLE}.linear_attribution_weight ;;
  }

  dimension: attributable_sale_price {
    hidden: yes
    type: number
    sql: ${orders.sale_price}*${linear_attribution_weight} ;;
  }
  dimension: marketing_cost_jv {
    type: number
    sql: ${orders.sale_price}*${linear_attribution_weight} * 0.07  ;;
  }

  dimension: attributable_estimated_margin {
    hidden: yes
    type: number
    sql: ${orders.estimated_margin}*${linear_attribution_weight} ;;
  }
  dimension: RevShare {
    type: yesno
    sql: ${offline_marketing_spend.jv__c} ;;
  }



# -------------------- MEASURES ------------------------

  measure: campaign_order_count {
    type: count
    drill_fields: [drill_detail*]
  }
  measure: Rev_Share_Revenue {
    type: sum
    sql:  ${attributable_sale_price} ;;
    value_format_name: usd_0
    drill_fields: [drill_detail*]
    filters: {
      field: RevShare
      value: "Yes"
    }
  }
  measure: Rev_Share_7 {
    type: sum
    sql:  ${attributable_sale_price}*0.07 ;;
    value_format_name: usd_0
    drill_fields: [drill_detail*]
    filters: {
      field: RevShare
      value: "Yes"
    }
  }
  measure: True_Cost{
    type: number
    sql: ${Rev_Share_7}+${offline_marketing_spend.total_spend} ;;
    value_format_name: usd_0
    drill_fields: [drill_detail*]
  }


  measure: total_weight {
    type: sum
    sql: ${linear_attribution_weight} ;;
    drill_fields: [drill_detail*]
  }

  measure: attributable_total_sales {
    type: sum
    sql: ${attributable_sale_price} ;;
    value_format_name: usd_0
    drill_fields: [drill_detail*]
  }
  measure: total_marketing_cost_jv {
    type: sum
    sql: ${marketing_cost_jv} ;;
    value_format_name: usd_0
    drill_fields: [drill_detail*]
  }
  measure: page_rate_jv {
    type: number
    sql: ${total_marketing_cost_jv}/${offline_marketing_spend.offline_campaign_count} ;;
    value_format_name: usd_0
    drill_fields: [drill_detail*]
  }


#   measure: attributable_total_net_sales {
#     type: number
#     sql: ${attributable_total_sales} - ${offline_marketing.total_spend} ;;
#     value_format_name: usd_0
#   }

  measure: attributable_total_margin {
    type: sum
    sql: ${attributable_estimated_margin} ;;
    value_format_name: usd_0
    drill_fields: [drill_detail*]
  }

  measure: marketing_cost_percent {
    type: number
    sql: (1.0*${True_Cost}/NULLIF(${attributable_total_sales},0)) ;;
    value_format_name: percent_2
    drill_fields: [drill_detail*]
  }

  measure: GMold {
    type: number
    sql: (${orders.estimated_margin}*${linear_attribution_weight})-${offline_marketing_spend.total_spend} ;;
    value_format_name: usd_0
    drill_fields: [drill_detail*]
  }

# -------------------- FILTERS & PARAMETERS ------------------------

  parameter: attribution_time_period {
#   hidden: yes
  type: string
  allowed_value: {
    label: "3 Days"
    value: "3 days"
  }
  allowed_value: {
    label: "5 Days"
    value: "5 days"
  }
  allowed_value: {
    label: "7 Days"
    value: "7 days"
  }
  allowed_value: {
    label: "10 Days"
    value: "10 days"
  }
  allowed_value: {
    label: "2 Weeks"
    value: "14 days"
  }
  allowed_value: {
    label: "3 Weeks"
    value: "21 days"
  }
  allowed_value: {
    label: "4 Weeks"
    value: "28 days"
  }
  allowed_value: {
    label: "ALL"
    value: "1000 days"
  }
}

parameter: marketing_percent {
  type: number
  allowed_value: {
    label: "5%"
    value: "5"
  }

}


# -------------------- SETS ---------------------------

set: drill_detail {
  fields: [
    offline_marketing_id,
    order_id,
    offline_marketing_campaign_date,
    orders_created_date,
    state,
    attributable_sale_price,
    attributable_estimated_margin
  ]
}
}
