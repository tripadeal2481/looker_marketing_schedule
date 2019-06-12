view: offline_campaign_attribution {
  derived_table: {
    explore_source: offline_marketing {
      derived_column: pk {
        sql: row_number() over() ;;
      }
      column: order_id { field: orders.id }
      column: offline_marketing_spend_id { field: offline_marketing_spend.id }
      derived_column: number_of_distinct_campaigns {
        sql: count(offline_marketing_spend_id) over(partition by order_id) ;;
      }
      bind_filters: {
        from_field: offline_marketing_spend.attribution_time_period
        to_field: offline_marketing_spend.attribution_time_period
      }
      filters: {
        field: online_campaign_attribution.order_id
        value: "NULL"
      }
      filters: {
        field: orders.real_order
        value: "Yes"
      }
    }
  }

  dimension: pk {
    primary_key: yes
    hidden: yes
  }

  dimension: order_id {}

  dimension: offline_marketing_spend_id {
    type: number
  }

  dimension: number_of_distinct_campaigns {
    type: number
  }

  dimension: offline_attribution_weight {
    type: number
    sql: 1.0/nullif(${number_of_distinct_campaigns},0) ;;
  }

  dimension: attributable_sale_price {
    type: number
    sql: ${orders.sale_price}*${offline_attribution_weight} ;;
  }

  dimension: Rev_Share{
    type: number
    sql: ${orders.sale_price}*${offline_attribution_weight} * 0.07 ;;
  }

  dimension: marketing_cost_jv {
    type: number
    sql: ${orders.sale_price}*${offline_attribution_weight} * 0.07  ;;
  }

  dimension: attributable_estimated_margin {
#     hidden: yes
  type: number
  sql: ${orders.estimated_margin}*${offline_attribution_weight} ;;
}


# -------------------- MEASURES ------------------------

measure: campaign_order_count {
  type: count
  drill_fields: [drill_detail*]
}



measure: total_weight {
  type: sum
  sql: ${offline_attribution_weight} ;;
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

measure: attributable_total_margin {
  type: sum
  sql: ${attributable_estimated_margin} ;;
  value_format_name: usd_0
  drill_fields: [drill_detail*]
}

measure: marketing_cost_percent {
  type: number
  sql: (1.0*${offline_marketing_spend.total_spend}/NULLIF(${attributable_total_sales},0)) ;;
  value_format_name: percent_2
  drill_fields: [drill_detail*]
}


measure: Rev_Share_Total {
  type: sum
  sql:  ${attributable_sale_price} * 0.07 ;;
  value_format_name: usd_0
  drill_fields: [drill_detail*]
}


measure: distinct_campaigns {
  type: count_distinct
  sql: ${offline_marketing_spend_id} ;;
}
#AB Edit
measure: GMoff {
  type: number
  sql: NULLIF(${attributable_estimated_margin},0)-NULLIF(${offline_marketing_spend.total_spend},0) ;;
  value_format_name: usd_0
  drill_fields: [drill_detail*]
}
#AB Edit

# -------------------- SETS ---------------------------

set: drill_detail {
  fields: [
    order_id,
    orders.created_date,
    offline_marketing_spend_id,
    offline_marketing_spend.campaign_date,
    offline_marketing_spend.state,
    attributable_sale_price,
    attributable_estimated_margin
  ]
}

}
