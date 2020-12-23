view: shop_addtnl_attrbts_d {
  label: "Dim - Shop Additional Attributes"
  sql_table_name: BAL3.SHOP_ADDTNL_ATTRBTS_D ;;

  dimension_group: dwh_creatd_datetm {
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
    hidden: yes
    sql: ${TABLE}.DWH_CREATD_DATETM ;;
  }

  dimension: dwh_shop_brand_id {
    type: number
    hidden:  yes
    primary_key: yes
    sql: ${TABLE}.DWH_SHOP_BRAND_ID ;;
  }

  dimension_group: dwh_updtd_datetm {
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
    hidden: yes
    sql: ${TABLE}.DWH_UPDTD_DATETM ;;
  }

  dimension_group: kiosk_go_live {
    label: "Kiosk Go Live"
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
    sql: ${TABLE}.KIOSK_GO_LIVE_DATE ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: []
  }
}
