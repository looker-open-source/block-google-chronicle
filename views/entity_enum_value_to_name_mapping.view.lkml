view: entity_enum_value_to_name_mapping {
  sql_table_name: `@{ENTITY_ENUM}`
    ;;

  dimension: enum_name {
    type: string
    sql: ${TABLE}.enum_name ;;
  }

  dimension: enum_value {
    type: number
    sql: ${TABLE}.enum_value ;;
  }

  dimension: field_path {
    type: string
    sql: ${TABLE}.field_path ;;
  }

  measure: count {
    type: count
    drill_fields: [enum_name]
  }
}
