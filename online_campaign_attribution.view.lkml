view: online_campaign_attribution {
  derived_table: {
    explore_source: online_marketing {
      derived_column: pk {
        sql: row_number() over() ;;
      }
      column: order_id { field: orders.id }
      column: context_campaign_medium { field: events.context_campaign_medium }
      column: context_campaign_source { field: events.context_campaign_source }
      column: context_campaign_name { field: events.context_campaign_name }
      derived_column: number_of_distinct_campaigns {
        sql: count(*) over(partition by order_id) ;;
      }
      filters: {
        field: orders.real_order
        value: "Yes"
      }
      filters: {
        field: events.context_campaign_name
        value: "-NULL,-tripadeal"
      }
    }
  }

  dimension: pk {
    primary_key: yes
    hidden: yes
  }

  dimension: order_id {}

  dimension: context_campaign_medium {}

  dimension: context_campaign_source {}

  dimension: context_campaign_name {}

  dimension: number_of_distinct_campaigns {
    type: number
  }

  dimension: online_attribution_weight {
    type: number
    sql: 1.0/nullif(${number_of_distinct_campaigns},0) ;;
  }

  dimension: attributable_sale_price {
    hidden: yes
    type: number
    sql: ${orders.sale_price}*${online_attribution_weight} ;;
  }

  dimension: attributable_estimated_margin {
    hidden: yes
    type: number
    sql: ${orders.estimated_margin}*${online_attribution_weight} ;;
  }


# -------------------- MEASURES ------------------------

  measure: campaign_order_count {
    type: count
  }

  measure: total_weight {
    type: sum
    sql: ${online_attribution_weight} ;;
  }

  measure: attributable_total_sales {
    type: sum
    sql: ${attributable_sale_price} ;;
    value_format_name: usd_0
  }

  measure: attributable_total_margin {
    type: sum
    sql: ${attributable_estimated_margin} ;;
    value_format_name: usd_0
  }








}
