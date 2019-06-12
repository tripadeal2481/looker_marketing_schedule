view: orders {
  sql_table_name: salesforce.order__c ;;


# ------------------------- FILTERS --------------------------

  filter: real_order {
    type: yesno
    sql: ${order_status} in ('Confirmed', 'Exported', 'Ready For Export') ;;
  }


# ------------------------- DIMENSIONS --------------------------

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }


  dimension: user_email {
    type: string
    sql: ${TABLE}.user_email__c ;;
  }

  dimension: account {
    type: string
    sql: ${TABLE}.account__c ;;
  }

  dimension: account_phone_number {
    type: string
    sql: ${TABLE}.account_phone_number__c ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state__c ;;
    link: {
      label: "State Performance Dashboard"
      url: "https://tripadeal.au.looker.com/dashboards/17?State={{value | url_encode}}"
      icon_url: "http://looker.com/favicon.ico"
    }
  }

  dimension: deal_id_and_title {
    type: string
    sql: ${TABLE}.Deal_ID_Title__c ;;
    link: {
      label: "Deal-level Dashboard"
      url: "https://tripadeal.au.looker.com/dashboards/16?Deal%20ID%20%26%20Title={{value | url_encode}}"
      icon_url: "http://looker.com/favicon.ico"
    }
  }

  dimension_group: created {
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

  dimension: deal_id {
    type: string
    sql: ${TABLE}.deal_id__c ;;
  }

  dimension: deal_and_option {
    type: string
    sql: ${TABLE}.deal_and_option__c ;;
  }

  dimension: deal_purchased {
    type: string
    sql: ${TABLE}.deal_purchased__c ;;
  }

  dimension: deal_option_purchased {
    type: string
    sql: ${TABLE}.deal_option_purchased__c ;;
  }

  dimension: deal_type {
    type: string
    sql: ${TABLE}.deal_type__c ;;
  }

  dimension: cruise {
    type: yesno
    sql: ${TABLE}.cruise__c ;;
  }

  dimension: is_phone_sale {
    type: yesno
    sql: ${TABLE}.is_phone_sale__c ;;
  }

  dimension: current_status {
    type: string
    sql: ${TABLE}.current_status__c ;;
  }

  dimension: order_status {
    type: string
    sql: ${TABLE}.order_status__c ;;
  }

  dimension: sale_price {
    hidden: yes
    type: number
    sql: ${TABLE}.total_price__c ;;
  }

  dimension: estimated_margin {
    hidden: yes
    type: number
    sql: ${TABLE}.estimated_margin__c ;;
  }



# ------------------------- MEASURES --------------------------

  measure: order_count {
    type: count
    drill_fields: [drill_detail*]
  }

  measure: real_order_count {
    type: count
    drill_fields: [drill_detail*]
    filters: {
      field:  real_order
      value: "Yes"
    }
  }



  measure: total_sales {
    type: sum
    sql: ${sale_price} ;;
    value_format_name: usd_0
    drill_fields: [drill_detail*]
  }

  measure: average_sale_price {
    type: average
    sql: ${sale_price} ;;
    value_format_name: usd_0
    drill_fields: [drill_detail*]
  }

  measure: total_margin {
    type: sum
    sql: ${estimated_margin} ;;
    value_format_name: usd_0
    drill_fields: [drill_detail*]
  }

  measure: first_order_created_date {
    type: date
    sql: min(${created_raw}) ;;
    drill_fields: [
      drill_detail*
    ]
  }

  measure: Female_PAX {
    type: sum
    sql: ${TABLE}.female_pax__c ;;
  }

  measure: Male_PAX {
    type: sum
    sql: ${TABLE}.male_pax__c ;;
  }
  measure: Quantity {
    type: sum
    sql: ${TABLE}.qty__c ;;
  }

# ------------------- SETS OF FIELDS --------------------------

  set: drill_detail {
    fields: [
      id,
      account,
      user_email,
      state,
      created_date,
      deal_option_purchased
    ]
  }


# ------------------- UNNECESSARY FIELDS ---------------------

#   dimension: _hc_err {
#     type: string
#     sql: ${TABLE}._hc_err ;;
#   }
#
#   dimension: _hc_lastop {
#     type: string
#     sql: ${TABLE}._hc_lastop ;;
#   }
#
#   dimension: abalg__c {
#     type: number
#     sql: ${TABLE}.abalg__c ;;
#   }
#
#   dimension: accom_nett__c {
#     type: number
#     sql: ${TABLE}.accom_nett__c ;;
#   }
#
#   dimension: account_phone__c {
#     type: string
#     sql: ${TABLE}.account_phone__c ;;
#   }
#
#   dimension: adamsale__c {
#     type: number
#     sql: ${TABLE}.adamsale__c ;;
#   }
#
#   dimension: additional_surcharges__c {
#     type: number
#     sql: ${TABLE}.additional_surcharges__c ;;
#   }
#
#   dimension: ae_accom_quote_request__c {
#     type: yesno
#     sql: ${TABLE}.ae_accom_quote_request__c ;;
#   }
#
#   dimension: ae_accomodation__c {
#     type: number
#     sql: ${TABLE}.ae_accomodation__c ;;
#   }
#
#   dimension: ae_city__c {
#     type: string
#     sql: ${TABLE}.ae_city__c ;;
#   }
#
#   dimension: ae_commission__c {
#     type: number
#     sql: ${TABLE}.ae_commission__c ;;
#   }
#
#   dimension: ae_nights__c {
#     type: number
#     sql: ${TABLE}.ae_nights__c ;;
#   }
#
#   dimension: ae_qty_commission__c {
#     type: number
#     sql: ${TABLE}.ae_qty_commission__c ;;
#   }
#
#   dimension: ae_qty_net_price__c {
#     type: number
#     sql: ${TABLE}.ae_qty_net_price__c ;;
#   }
#
#   dimension: agent__c {
#     type: string
#     sql: ${TABLE}.agent__c ;;
#   }
#
#   dimension: agent_address__c {
#     type: string
#     sql: ${TABLE}.agent_address__c ;;
#   }
#
#   dimension: agent_email_address__c {
#     type: string
#     sql: ${TABLE}.agent_email_address__c ;;
#   }
#
#   dimension: agent_image__c {
#     type: string
#     sql: ${TABLE}.agent_image__c ;;
#   }
#
#   dimension: agent_phone_number__c {
#     type: string
#     sql: ${TABLE}.agent_phone_number__c ;;
#   }
#
#   dimension: agent_state__c {
#     type: string
#     sql: ${TABLE}.agent_state__c ;;
#   }
#
#   dimension: airline_upgrade_commission__c {
#     type: number
#     sql: ${TABLE}.airline_upgrade_commission__c ;;
#   }
#
#   dimension: airline_upgrade_qty_commission__c {
#     type: number
#     sql: ${TABLE}.airline_upgrade_qty_commission__c ;;
#   }
#
#   dimension: airline_upgrade_qty_net_price__c {
#     type: number
#     sql: ${TABLE}.airline_upgrade_qty_net_price__c ;;
#   }
#
#   dimension_group: arrival_date_time__c {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.arrival_date_time__c ;;
#   }
#
#   dimension_group: bc_date__c {
#     type: time
#     timeframes: [
#       raw,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     convert_tz: no
#     datatype: date
#     sql: ${TABLE}.bc_date__c ;;
#   }
#
#   dimension: bc_sent__c {
#     type: yesno
#     sql: ${TABLE}.bc_sent__c ;;
#   }
#
#   dimension: bedding_config__c {
#     type: string
#     sql: ${TABLE}.bedding_config__c ;;
#   }
#
#   dimension_group: booking_date1__c {
#     type: time
#     timeframes: [
#       raw,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     convert_tz: no
#     datatype: date
#     sql: ${TABLE}.booking_date1__c ;;
#   }
#
#   dimension_group: booking_date2__c {
#     type: time
#     timeframes: [
#       raw,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     convert_tz: no
#     datatype: date
#     sql: ${TABLE}.booking_date2__c ;;
#   }
#
#   dimension_group: booking_date3__c {
#     type: time
#     timeframes: [
#       raw,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     convert_tz: no
#     datatype: date
#     sql: ${TABLE}.booking_date3__c ;;
#   }
#
#   dimension_group: booking_date4__c {
#     type: time
#     timeframes: [
#       raw,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     convert_tz: no
#     datatype: date
#     sql: ${TABLE}.booking_date4__c ;;
#   }
#
#   dimension_group: booking_date5__c {
#     type: time
#     timeframes: [
#       raw,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     convert_tz: no
#     datatype: date
#     sql: ${TABLE}.booking_date5__c ;;
#   }
#
#   dimension_group: booking_date__c {
#     type: time
#     timeframes: [
#       raw,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     convert_tz: no
#     datatype: date
#     sql: ${TABLE}.booking_date__c ;;
#   }
#
#   dimension: booking_validation__c {
#     type: string
#     sql: ${TABLE}.booking_validation__c ;;
#   }
#
#   dimension: bsb_zip_payment_pending__c {
#     type: string
#     sql: ${TABLE}.bsb_zip_payment_pending__c ;;
#   }
#
#   dimension: cabin_bookings_outstanding__c {
#     type: number
#     sql: ${TABLE}.cabin_bookings_outstanding__c ;;
#   }
#
#   dimension: cabins_booked__c {
#     type: number
#     sql: ${TABLE}.cabins_booked__c ;;
#   }
#
#   dimension: cabins_pending__c {
#     type: number
#     sql: ${TABLE}.cabins_pending__c ;;
#   }
#
#   dimension: cabins_required__c {
#     type: number
#     sql: ${TABLE}.cabins_required__c ;;
#   }
#
#   dimension: conga_deal_pdf__c {
#     type: string
#     sql: ${TABLE}.conga_deal_pdf__c ;;
#   }
#
#   dimension: conga_tc_pc_formula__c {
#     type: string
#     sql: ${TABLE}.conga_tc_pc_formula__c ;;
#   }
#
#   dimension: conga_tc_pc_stay_dates_no_flights__c {
#     type: string
#     sql: ${TABLE}.conga_tc_pc_stay_dates_no_flights__c ;;
#   }
#
#   dimension: conga_tc_pc_stay_no_dates_no_flights__c {
#     type: string
#     sql: ${TABLE}.conga_tc_pc_stay_no_dates_no_flights__c ;;
#   }
#
#   dimension: conga_tc_pc_travel__c {
#     type: string
#     sql: ${TABLE}.conga_tc_pc_travel__c ;;
#   }
#
#   dimension: consultant_email__c {
#     type: string
#     sql: ${TABLE}.consultant_email__c ;;
#   }
#
#   dimension: consultants__c {
#     type: string
#     sql: ${TABLE}.consultants__c ;;
#   }
#
#   dimension: created_by_current_user__c {
#     type: yesno
#     sql: ${TABLE}.created_by_current_user__c ;;
#   }
#
#   dimension_group: created_datetc__c {
#     type: time
#     timeframes: [
#       raw,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     convert_tz: no
#     datatype: date
#     sql: ${TABLE}.created_datetc__c ;;
#   }
#
#   dimension: createdbyid {
#     type: string
#     sql: ${TABLE}.createdbyid ;;
#   }
#

#
#   dimension: dataloadrefresh__c {
#     type: yesno
#     sql: ${TABLE}.dataloadrefresh__c ;;
#   }
#
#   dimension: dates_flights__c {
#     type: string
#     sql: ${TABLE}.dates_flights__c ;;
#   }
#
#   dimension: day_month_pc__c {
#     type: string
#     sql: ${TABLE}.day_month_pc__c ;;
#   }
#
#   dimension: departure_city {
#     type: string
#     sql: ${TABLE}.city__c ;;
#   }
#
#   dimension: deal_id_title__c {
#     type: string
#     sql: ${TABLE}.deal_id_title__c ;;
#   }
#
#   dimension: deal_idtc__c {
#     type: string
#     sql: ${TABLE}.deal_idtc__c ;;
#   }

#
#   dimension: dealfc__c {
#     type: string
#     sql: ${TABLE}.dealfc__c ;;
#   }
#
#   dimension: dealopdateremovedpc__c {
#     type: string
#     sql: ${TABLE}.dealopdateremovedpc__c ;;
#   }
#
#   dimension: dealsfid__c {
#     type: string
#     sql: ${TABLE}.dealsfid__c ;;
#   }

#
#   dimension: isdeleted {
#     type: yesno
#     sql: ${TABLE}.isdeleted ;;
#   }
#
#   dimension: name {
#     type: string
#     sql: ${TABLE}.name ;;
#   }
#
#   dimension: sfid {
#     type: string
#     sql: ${TABLE}.sfid ;;
#   }
#
#   dimension_group: systemmodstamp {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.systemmodstamp ;;
#   }


}
