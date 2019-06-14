view: deal__c {
  sql_table_name: salesforce.deal__c ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: _hc_err {
    type: string
    sql: ${TABLE}._hc_err ;;
  }

  dimension: _hc_lastop {
    type: string
    sql: ${TABLE}._hc_lastop ;;
  }

  dimension: allocation_by__c {
    type: string
    sql: ${TABLE}.allocation_by__c ;;
  }

  dimension: bdm__c {
    type: string
    sql: ${TABLE}.bdm__c ;;
  }

  dimension_group: book_by__c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.book_by__c ;;
  }

  dimension_group: book_by_nz__c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.book_by_nz__c ;;
  }

  dimension: category__c {
    type: string
    sql: ${TABLE}.category__c ;;
  }

  dimension: category_nz__c {
    type: string
    sql: ${TABLE}.category_nz__c ;;
  }

  dimension: country__c {
    type: string
    sql: ${TABLE}.country__c ;;
  }

  dimension: country_nz__c {
    type: string
    sql: ${TABLE}.country_nz__c ;;
  }

  dimension_group: createddate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.createddate ;;
  }

  dimension: days_nights__c {
    type: string
    sql: ${TABLE}.days_nights__c ;;
  }

  dimension: deal_estimated_margin__c {
    type: number
    sql: ${TABLE}.deal_estimated_margin__c ;;
  }

  dimension: deal_estimated_profit__c {
    type: number
    sql: ${TABLE}.deal_estimated_profit__c ;;
  }

  dimension: deal_id__c {
    type: string
    # hidden: yes
    sql: ${TABLE}.deal_id__c ;;
  }

  dimension: deal_id_title__c {
    type: string
    sql: ${TABLE}.deal_id_title__c ;;
  }

  dimension: deal_margin_check__c {
    type: string
    sql: ${TABLE}.deal_margin_check__c ;;
  }

  dimension_group: deal_open_date__c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.deal_open_date__c ;;
  }

  dimension: deal_status__c {
    type: string
    sql: ${TABLE}.deal_status__c ;;
  }

  dimension: deal_type__c {
    type: string
    sql: ${TABLE}.deal_type__c ;;
  }

  dimension: deal_type_nz__c {
    type: string
    sql: ${TABLE}.deal_type_nz__c ;;
  }

  dimension: edm_count__c {
    type: number
    sql: ${TABLE}.edm_count__c ;;
  }

  dimension_group: end_date__c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.end_date__c ;;
  }

  dimension_group: end_date_nz__c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.end_date_nz__c ;;
  }

  dimension: estimated_margin__c {
    type: number
    sql: ${TABLE}.estimated_margin__c ;;
  }

  dimension: estimated_margin_nz__c {
    type: number
    sql: ${TABLE}.estimated_margin_nz__c ;;
  }

  dimension: flights_max_nett__c {
    type: number
    sql: ${TABLE}.flights_max_nett__c ;;
  }

  dimension: has_flights__c {
    type: yesno
    sql: ${TABLE}.has_flights__c ;;
  }

  dimension: is_escapes__c {
    type: yesno
    sql: ${TABLE}.is_escapes__c ;;
  }

  dimension: is_paf_flights__c {
    type: yesno
    sql: ${TABLE}.is_paf_flights__c ;;
  }

  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}.isdeleted ;;
  }

  dimension: margind__c {
    type: number
    sql: ${TABLE}.margind__c ;;
  }

  dimension: margind_nz__c {
    type: number
    sql: ${TABLE}.margind_nz__c ;;
  }

  dimension: marginp__c {
    type: number
    sql: ${TABLE}.marginp__c ;;
  }

  dimension: marginp_nz__c {
    type: number
    sql: ${TABLE}.marginp_nz__c ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: number_of_days__c {
    type: number
    sql: ${TABLE}.number_of_days__c ;;
  }

  dimension: number_of_days_nz__c {
    type: number
    sql: ${TABLE}.number_of_days_nz__c ;;
  }

  dimension: price__c {
    type: number
    sql: ${TABLE}.price__c ;;
  }
  dimension: y_value__c {
    type: number
    sql: ${TABLE}.y_value__c ;;
  }

  dimension: price_nz__c {
    type: number
    sql: ${TABLE}.price_nz__c ;;
  }

  dimension: qty_sold__c {
    type: number
    sql: ${TABLE}.qty_sold__c ;;
  }

  dimension_group: real_end_date__c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.real_end_date__c ;;
  }

  dimension_group: real_end_date_nz__c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.real_end_date_nz__c ;;
  }

  dimension: region__c {
    type: string
    sql: ${TABLE}.region__c ;;
  }

  dimension: region_nz__c {
    type: string
    sql: ${TABLE}.region_nz__c ;;
  }

  dimension: remaining_weeks_on_sale__c {
    type: number
    sql: ${TABLE}.remaining_weeks_on_sale__c ;;
  }

  dimension: sfid {
    type: string
    sql: ${TABLE}.sfid ;;
  }

  dimension: site__c {
    type: string
    sql: ${TABLE}.site__c ;;
  }

  dimension_group: start_date__c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.start_date__c ;;
  }

  dimension: status__c {
    type: string
    sql: ${TABLE}.status__c ;;
  }

  dimension: status_nz__c {
    type: string
    sql: ${TABLE}.status_nz__c ;;
  }

  dimension_group: systemmodstamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.systemmodstamp ;;
  }

  dimension: tad_deal_id__c {
    type: string
    sql: ${TABLE}.tad_deal_id__c ;;
  }

  dimension: tc_status__c {
    type: string
    sql: ${TABLE}.tc_status__c ;;
  }

  dimension: title__c {
    type: string
    sql: ${TABLE}.title__c ;;
  }

  dimension: title_nz__c {
    type: string
    sql: ${TABLE}.title_nz__c ;;
  }

  dimension: total_held_allocations__c {
    type: number
    sql: ${TABLE}.total_held_allocations__c ;;
  }

  dimension: total_instagram_spend__c {
    type: number
    sql: ${TABLE}.total_instagram_spend__c ;;
  }

  dimension: total_marketing_spend__c {
    type: number
    sql: ${TABLE}.total_marketing_spend__c ;;
  }

  dimension: total_newspaper_spend__c {
    type: number
    sql: ${TABLE}.total_newspaper_spend__c ;;
  }

  dimension: total_other_spend__c {
    type: number
    sql: ${TABLE}.total_other_spend__c ;;
  }

  dimension: total_qty_sold__c {
    type: number
    sql: ${TABLE}.total_qty_sold__c ;;
  }

  dimension: total_radio_spend__c {
    type: number
    sql: ${TABLE}.total_radio_spend__c ;;
  }

  dimension: total_remaining_allocations__c {
    type: number
    sql: ${TABLE}.total_remaining_allocations__c ;;
  }

  dimension: total_revenue_au__c {
    type: number
    sql: ${TABLE}.total_revenue_au__c ;;
  }

  dimension: total_revenue_nz__c {
    type: number
    sql: ${TABLE}.total_revenue_nz__c ;;
  }

  dimension: total_sales__c {
    type: number
    sql: ${TABLE}.total_sales__c ;;
  }

  dimension: total_sold_allocations__c {
    type: number
    sql: ${TABLE}.total_sold_allocations__c ;;
  }

  dimension: tp_sent__c {
    type: yesno
    sql: ${TABLE}.tp_sent__c ;;
  }

  dimension: travel_pack_type__c {
    type: string
    sql: ${TABLE}.travel_pack_type__c ;;
  }

  dimension: typically__c {
    type: number
    sql: ${TABLE}.typically__c ;;
  }

  dimension: typically_nz__c {
    type: number
    sql: ${TABLE}.typically_nz__c ;;
  }

  dimension: uj_portal_access__c {
    type: yesno
    sql: ${TABLE}.uj_portal_access__c ;;
  }

  dimension: url__c {
    type: string
    sql: ${TABLE}.url__c ;;
  }

  dimension: url_nz__c {
    type: string
    sql: ${TABLE}.url_nz__c ;;
  }

  dimension_group: valid_from__c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.valid_from__c ;;
  }

  dimension_group: valid_from_nz__c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.valid_from_nz__c ;;
  }

  dimension_group: valid_to__c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.valid_to__c ;;
  }

  dimension_group: valid_to_nz__c {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.valid_to_nz__c ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, deal__c.name, deal__c.id, deal__c.count]
  }
}
