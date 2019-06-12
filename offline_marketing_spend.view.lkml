view: offline_marketing_spend {
  sql_table_name: salesforce.marketing_spend__c ;;


#-------------- DIMENSIONS -------------------------

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: partner {
    type: string
    sql: ${TABLE}.partner__c ;;
  }

  dimension_group: campaign {
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
    sql: ${TABLE}.date__c ;;
  }

  dimension: deal_id {
    type: string
    sql: ${TABLE}.deal_id__c ;;
  }
  dimension:  Deal_ID_Title {
    type: string
    sql: ${TABLE}.Deal_ID_Title__c ;;
  }
  dimension: marketing_channel {
    type: string
    sql: ${TABLE}.marketing_channel__c ;;
  }
  dimension: Media_Partner{
    type: string
    sql: ${TABLE}.Media_Partner__c ;;
  }


  dimension: marketing_source {
    type: string
    sql: ${TABLE}.marketing_source__c ;;
    link: {
      label: "Marketing Source Dashboard"
      url: "https://tripadeal.au.looker.com/dashboards/18?Marketing%20Source={{value | url_encode}}"
      icon_url: "http://looker.com/favicon.ico"
    }
  }

  dimension: Section {
    type: string
    sql: ${TABLE}.Section__c ;;
  }

  dimension: spend {
    hidden: yes
    type: number
    sql: ${TABLE}.spend__c ;;
  }

  dimension: jv__c {
    type: yesno
    sql: ${TABLE}.jv__c ;;
  }

  dimension: bonus__c {
    type: yesno
    sql: ${TABLE}.bonus__c ;;
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


#-------------- MEASURES -------------------------

  measure: offline_campaign_count {
    type: count
    drill_fields: [drill_detail*]
  }

  measure: total_spend {
    type: sum
    sql: ${spend} ;;
    value_format_name: usd_0
    drill_fields: [drill_detail*]
  }

  measure: average_spend {
    type: average
    sql: ${spend} ;;
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
# -----------------------Country-------------------------------

parameter: Country {
#   hidden: yes
type: string
allowed_value: {
  label: "Australia"
  value: "Australia"
}
allowed_value: {
  label: "New Zealand"
  value: "New Zealand"
}

}
# -----------------------Marketing Channel-------------------------------

parameter: Marketing_Channel{
#   hidden: yes
type: string
allowed_value: {
  label: "Electronic Direct Mail (eDM)"
  value: "Electronic Direct Mail (eDM)"
}
allowed_value: {
  label: "Social Media"
  value: "Social Media"
}
allowed_value: {
  label: "Digital Display"
  value: "Digital Display"
}
allowed_value: {
  label: "Revenue Share Print Media (Newspaper)"
  value: "Revenue Share Print Media (Newspaper)"
}
allowed_value: {
  label: "Print Media (Newspaper)"
  value: "Print Media (Newspaper)"
}
allowed_value: {
  label: "Radio"
  value: "Radio"
}
allowed_value: {
  label: "TV"
  value: "TV"
}
allowed_value: {
  label: "Road Show"
  value: "Road Show"
}
allowed_value: {
  label: "Mailbox Drop"
  value: "Mailbox Drop"
}
allowed_value: {
  label: "Search"
  value: "Search"
}
allowed_value: {
  label: "Billboard"
  value: "Billboard"
}
allowed_value: {
  label: "All"
  value: "All"
}

}

# ------------------- SETS OF FIELDS --------------------------

set: drill_detail {
  fields: [
    id,
    name,
    campaign_date,
    state,
    marketing_channel,
    marketing_source,
    deal_id,
    spend
  ]
}


#-------------- UNNECESSARY FIELDS -----------------

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
#
#   dimension_group: created {
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
#     sql: ${TABLE}.createddate ;;
#   }
#

#   dimension: deal__c {
#     type: string
#     sql: ${TABLE}.deal__c ;;
#   }
#
#   dimension: detail__c {
#     type: string
#     sql: ${TABLE}.detail__c ;;
#   }
#
#   dimension: isdeleted {
#     type: yesno
#     sql: ${TABLE}.isdeleted ;;
#   }
#
#
#   dimension: section__c {
#     type: string
#     sql: ${TABLE}.section__c ;;
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
#
#   dimension: type__c {
#     type: string
#     sql: ${TABLE}.type__c ;;
#   }

}
