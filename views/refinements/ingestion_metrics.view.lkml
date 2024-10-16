include: "/views/ingestion_metrics.view"

view: +ingestion_metrics {
  dimension_group: timestamp{
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      hour,
      minute,
      year
    ]
    datatype: epoch
    sql: UNIX_SECONDS(${TABLE}.start_time) ;;
  }

  measure: total_entry_number {
    type: sum
    sql:
    CASE
      WHEN ${TABLE}.component = "Ingestion API"
        THEN ${TABLE}.log_count
    END;;
    # link: {
    #   label: "Data Ingestion and Health Dashboard"
    #   url: "@{DATA_INGESTION_AND_HEALTH_DASHBOARD}"
    #   icon_url: "@{DASHBOARD_ICON_URL}"
    # }
    }

  measure: total_entry_number_in_million {
    type: number
    sql: round(${total_entry_number}/1000000, 0) ;;
  }

  measure: total_entry_number_in_million_for_drill {
    type: number
    sql: round(${total_entry_number}/1000000, 0) ;;
    # link: {
    #   label: "Data Ingestion and Health Dashboard"
    #   url: "@{DATA_INGESTION_AND_HEALTH_DASHBOARD}"
    #   icon_url: "@{DASHBOARD_ICON_URL}"
    # }
  }

  measure: total_error_count_in_million {
    type: sum
    sql:
        CASE
          WHEN ${TABLE}.component = 'Normalizer' AND ${TABLE}.state = 'failed_validation'
            THEN round(${TABLE}.event_count/1000000, 0)
          WHEN ${TABLE}.component = 'Normalizer' AND ${TABLE}.state = 'failed_parsing'
            THEN round(${TABLE}.log_count/1000000, 0)
        END;;
  }

  measure: total_size_bytes {
    type: sum
    sql:
        CASE
          WHEN ${TABLE}.component = "Ingestion API"
            THEN ${TABLE}.log_volume
        END;;
        # link: {
        #   label: "Data Ingestion and Health Dashboard"
        #   url: "@{DATA_INGESTION_AND_HEALTH_DASHBOARD}"
        #   icon_url: "@{DASHBOARD_ICON_URL}"
        # }
    }

  measure: total_size_bytes_GB {
      type: number
      sql: round(${total_size_bytes}/1000/1000/1000, 2) ;;
  }

  measure: total_size_bytes_GB_for_drill {
    type: number
    sql: round(${total_size_bytes}/1000/1000/1000, 2) ;;
    # link: {
    #   label: "Data Ingestion and Health Dashboard"
    #   url: "@{DATA_INGESTION_AND_HEALTH_DASHBOARD}"
    #   icon_url: "@{DASHBOARD_ICON_URL}"
    # }
  }

  measure: total_size_bytes_GiB {
    type: number
    sql: round(${total_size_bytes}/1024/1024/1024, 2) ;;
  }
  measure: total_events {
    type: sum
    sql:
    CASE
      WHEN ${TABLE}.component = 'Normalizer' AND ${TABLE}.state = 'validated' THEN ${TABLE}.event_count
    END;;
  }

  measure: total_events {
    type: sum
    sql:
    CASE
      WHEN ${TABLE}.component = 'Normalizer' AND ${TABLE}.state = 'validated' THEN ${TABLE}.event_count
    END;;

  }

  measure: total_error_events {
    type: sum
    sql:
    CASE
      WHEN ${TABLE}.component = 'Normalizer' AND ${TABLE}.state = 'failed_validation'
        THEN ${TABLE}.event_count
      WHEN ${TABLE}.component = 'Normalizer' AND ${TABLE}.state = 'failed_parsing'
        THEN ${TABLE}.log_count
    END;;
  }

  measure: total_normalized_events {
    type: sum
    sql:
    CASE
      WHEN ${TABLE}.component = 'Normalizer' AND ${TABLE}.state = 'validated' THEN ${TABLE}.event_count
    END;;
  }

  measure: total_validation_error_events {
    type: sum
    sql:
    CASE
      WHEN ${TABLE}.component = 'Normalizer' AND ${TABLE}.state = 'failed_validation' THEN ${TABLE}.event_count
    END;;
  }

  measure: total_parsing_error_events {
    type: sum
    sql:
    CASE
      WHEN ${TABLE}.component = 'Normalizer' AND ${TABLE}.state = 'failed_parsing' THEN ${TABLE}.log_count
    END;;
  }

  # Breaks Events Over Time right now...
  dimension: period {
    type: string
    description: "The reporting period as selected by the Period Filter. Values - 'This Period' and 'Previous Period'.
    Apply Filter 'This Period' to get values from current period."
    sql:
      CASE
        WHEN {% date_start period_filter %} is not null AND {% date_end period_filter %} is not null /* date ranges or in the past x days */
          THEN
            CASE
              WHEN ${end_raw} >= UNIX_SECONDS({% date_start period_filter %})
                AND ${start_raw} <= UNIX_SECONDS({% date_end period_filter %})
                THEN 'This Period'
              WHEN ${end_raw} >= UNIX_SECONDS(TIMESTAMP_ADD({% date_start period_filter %}, INTERVAL 1 * (TIMESTAMP_DIFF({% date_start period_filter %},{% date_end period_filter %}, DAY))  DAY))
                AND ${start_raw} <= UNIX_SECONDS(TIMESTAMP_ADD({% date_start period_filter %}, INTERVAL -1 DAY))
                THEN 'Previous Period'
            END
        WHEN {% date_start period_filter %} is not null
          THEN
            CASE
              WHEN ${end_raw} >= UNIX_SECONDS({% date_start period_filter %})
                THEN 'This Period'
            END
        WHEN {% date_end period_filter %} is not null
          THEN
            CASE
              WHEN ${start_raw} <= UNIX_SECONDS({% date_end period_filter %})
                THEN 'This Period'
            END
        END ;;
  }

  filter: period_filter {
    label: "Filter for Period Dimension"
    hidden: yes
    type: date
    description: "Use this filter to define the current and previous period for analysis - only to be used with the Period Dimension"
    sql: ${period} IS NOT NULL ;;
  }

  dimension: log_type_for_drill {
    type: string
    sql:
    CASE
      WHEN ${TABLE}.log_type is not null THEN ${log_type}
    END;;
  }

  dimension: valid_log_type {
    type: string
    sql:COALESCE(${log_type},null);;
  }
}
