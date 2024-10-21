view: ingestion_metric_with_ingestion_stats {
  derived_table: {
    sql:WITH ingestion_metrics AS (SELECT
        UNIX_SECONDS(TIMESTAMP (ingestion_metrics.start_time)) AS time,
        ingestion_metrics.log_type AS log_type,
        ingestion_metrics.component AS component,
        ingestion_metrics.log_volume AS log_volume,
        ingestion_metrics.log_count AS log_count,
        ingestion_metrics.event_count AS event_count,
        ingestion_metrics.state AS state
      FROM `@{INGESTION_METRICS}` AS ingestion_metrics
      WHERE UNIX_SECONDS(TIMESTAMP (ingestion_metrics.start_time)) > 1650947400)
      # ingestion_stats AS (SELECT
      #   ingestion_stats.timestamp_sec AS time,
      #   ingestion_stats.log_type AS log_type,
      #   ingestion_stats.time_bucket AS time_bucket,
      #   ingestion_stats.entry_number AS entry_number,
      #   ingestion_stats.size_bytes AS size_bytes,
      #   ingestion_stats.normalized_event_count AS normalized_event_count,
      #   ingestion_stats.parsing_error_count AS parsing_error_count,
      #   ingestion_stats.validation_error_count AS validation_error_count,
      #   ingestion_stats.total_error_count AS total_error_count,
      # FROM `@{INGESTION_STATS}` AS ingestion_stats
      # WHERE ingestion_stats.timestamp_sec < 1650947400)
      SELECT * FROM @{INGESTION_METRICS}
       ;;
  }

  # All dimensions below this are deprecated. They are added to support old exposed fields.
  
  dimension: entry_number {
    description: "Deprecated"
    type: number
    sql: null ;;
  }

  dimension: normalized_event_count {
    description: "Deprecated"
    type: number
    sql: null ;;
  }

  dimension: parsing_error_count {
    description: "Deprecated"
    type: number
    sql: null ;;
  }

  dimension: size_bytes {
    description: "Deprecated"
    type: number
    sql: null ;;
  }

  dimension: time_bucket {
    description: "Deprecated"
    type: string
    sql: "" ;;
  }

  dimension: total_error_count {
    description: "Deprecated"
    type: number
    sql: null ;;
  }

  dimension: validation_error_count {
    description: "Deprecated"
    type: number
    sql: null ;;
  }

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
    sql:${TABLE}.time;;
  }

  measure: total_entry_number {
    type: sum
    sql:
    CASE
      WHEN ${TABLE}.time < 1650947400
        THEN ${TABLE}.entry_number
      ELSE
          CASE
            WHEN ${TABLE}.component = "Ingestion API"
              THEN ${TABLE}.log_count
          END
    END;;
    # link: {
    #   label: "Data Ingestion and Health Dashboard"
    #   url: "@{DATA_INGESTION_AND_HEALTH_DASHBOARD}"
    #   icon_url: "@{DASHBOARD_ICON_URL}"
    # }
  }

  measure: total_entry_number_in_million {
    type: sum
    sql: round(${total_entry_number}/1000000, 0) ;;
  }

  measure: total_entry_number_in_million_for_drill {
    type: sum
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
          WHEN ${TABLE}.time < 1650947400
            THEN ${TABLE}.total_error_count
          ELSE
            CASE
              WHEN ${TABLE}.component = 'Normalizer' AND ${TABLE}.state = 'failed_validation'
                THEN round(${TABLE}.event_count/1000000, 0)
              WHEN ${TABLE}.component = 'Normalizer' AND ${TABLE}.state = 'failed_parsing'
                THEN round(${TABLE}.log_count/1000000, 0)
            END
        END;;
  }

  measure: total_size_bytes {
    type: sum
    sql:
        CASE
          WHEN ${TABLE}.time < 1650947400
            THEN ${TABLE}.size_bytes
          ELSE
              CASE
                WHEN ${TABLE}.component = "Ingestion API"
                  THEN ${TABLE}.log_volume
              END
        END;;
        # link: {
        #   label: "Data Ingestion and Health Dashboard"
        #   url: "@{DATA_INGESTION_AND_HEALTH_DASHBOARD}"
        #   icon_url: "@{DASHBOARD_ICON_URL}"
        # }
  }

  measure: total_size_bytes_GB {
    type: sum
    sql: round(${total_size_bytes}/1000/1000/1000, 2) ;;
  }

  measure: total_size_bytes_GB_for_drill {
    type: sum
    sql: round(${total_size_bytes}/1000/1000/1000, 2) ;;
    # link: {
    #   label: "Data Ingestion and Health Dashboard"
    #   url: "@{DATA_INGESTION_AND_HEALTH_DASHBOARD}"
    #   icon_url: "@{DASHBOARD_ICON_URL}"
    # }
  }

  measure: total_size_bytes_GiB {
    type: sum
    sql:
        CASE
          WHEN ${TABLE}.time < 1650947400
            THEN round((${TABLE}.size_bytes)/1024/1024/1024, 2)
          ELSE
              CASE
                WHEN ${TABLE}.component = "Ingestion API"
                  THEN round((${TABLE}.log_volume)/1024/1024/1024, 2)
              END
        END;;
  }
  measure: total_events {
    type: sum
    sql:
        CASE
          WHEN ${TABLE}.time < 1650947400
            THEN ${TABLE}.entry_number
          ELSE
              CASE
                WHEN ${TABLE}.component = 'Normalizer' AND ${TABLE}.state = 'validated' THEN ${TABLE}.event_count
              END
        END;;

  }

  measure: total_error_events {
    type: sum
    sql:
        CASE
          WHEN ${TABLE}.time < 1650947400
            THEN ${TABLE}.total_error_count
          ELSE
            CASE
              WHEN ${TABLE}.component = 'Normalizer' AND ${TABLE}.state = 'failed_validation'
                THEN round(${TABLE}.event_count/1000000, 0)
              WHEN ${TABLE}.component = 'Normalizer' AND ${TABLE}.state = 'failed_parsing'
                THEN round(${TABLE}.log_count/1000000, 0)
            END
        END;;
  }

  measure: total_normalized_events {
    type: sum
    sql:
        CASE
          WHEN ${TABLE}.time < 1650947400
            THEN ${TABLE}.normalized_event_count
          ELSE
            CASE
              WHEN ${TABLE}.component = 'Normalizer' AND ${TABLE}.state = 'validated' THEN ${TABLE}.event_count
            END
        END;;
  }

  measure: total_validation_error_events {
    type: sum
    sql:
        CASE
          WHEN ${TABLE}.time < 1650947400
            THEN ${TABLE}.validation_error_count
          ELSE
            CASE
              WHEN ${TABLE}.component = 'Normalizer' AND ${TABLE}.state = 'failed_validation' THEN ${TABLE}.event_count
            END
        END;;
  }

  measure: total_parsing_error_events {
    type: sum
    sql:
        CASE
          WHEN ${TABLE}.time < 1650947400
            THEN ${TABLE}.parsing_error_count
          ELSE
            CASE
              WHEN ${TABLE}.component = 'Normalizer' AND ${TABLE}.state = 'failed_parsing' THEN ${TABLE}.log_count
            END
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
                  WHEN ${timestamp_raw} >= UNIX_SECONDS({% date_start period_filter %})
                    AND ${timestamp_raw} <= UNIX_SECONDS({% date_end period_filter %})
                    THEN 'This Period'
                  WHEN ${timestamp_raw} >= UNIX_SECONDS(TIMESTAMP_ADD({% date_start period_filter %}, INTERVAL 1 * (TIMESTAMP_DIFF({% date_start period_filter %},{% date_end period_filter %}, DAY))  DAY))
                    AND ${timestamp_raw} <= UNIX_SECONDS(TIMESTAMP_ADD({% date_start period_filter %}, INTERVAL -1 DAY))
                    THEN 'Previous Period'
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
          WHEN ${TABLE}.log_type is not null THEN ${TABLE}.log_type
        END;;
  }


  dimension: log_type {
    type: string
    sql: ${TABLE}.log_type ;;
  }
  measure: count {
    type: count
    drill_fields: []
  }
}
