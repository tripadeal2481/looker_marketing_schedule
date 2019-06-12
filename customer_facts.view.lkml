# If necessary, uncomment the line below to include explore_source.
# include: "marketing.model.lkml"

view: customer_facts {
  derived_table: {
    explore_source: customers {
      column: user_email { field: orders.user_email }
      column: real_order_count { field: orders.real_order_count }
      column: first_order_created_date { field: orders.first_order_created_date }
      column: total_sales { field: orders.total_sales }
      column: total_margin { field: orders.total_margin }
      filters: {
        field: orders.user_email
        value: "-NULL"
      }
      filters: {
        field: orders.real_order
        value: "Yes"
      }
    }
  }


# ------------------------ DIMENSIONS --------------------------------

  dimension: user_email {
    primary_key: yes
  }

  dimension: real_order_count {
    type: number
  }
  #Start of adam edit
#  dimension: PAX Quantity{
  #   type: number
#    sql: ${TABLE} ;;
#  }
  #end of adam edit

  dimension_group: first_order_created {
    type: time
    datatype: date
    sql: ${TABLE}.first_order_created_date ;;
    timeframes: [
      date,
      month,
      year
    ]
  }

  dimension: total_sales {
    value_format: "$#,##0"
    type: number
  }

  dimension: total_margin {
    value_format: "$#,##0"
    type: number
  }

# ------------------------ MEASURES --------------------------------

  measure: count {
    type: count
  }



}
