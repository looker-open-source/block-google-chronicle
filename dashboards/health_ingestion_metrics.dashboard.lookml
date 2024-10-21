- dashboard: health_ingestion_metrics
  title: Data Ingestion and Health
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Log Type Distribution by Events Count
    name: Log Type Distribution by Events Count
    explore: ingestion_metrics
    type: looker_pie
    fields: [ingestion_metrics.log_type, ingestion_metrics.total_entry_number]
    filters:
      ingestion_metrics.period: This Period
    sorts: [ingestion_metrics.total_entry_number desc]
    limit: 50
    value_labels: legend
    label_type: labPer
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Time: ingestion_metrics.period_filter
      Log Type: ingestion_metrics.log_type
    row: 3
    col: 0
    width: 12
    height: 6
  - title: Log Type Distribution by Throughput
    name: Log Type Distribution by Throughput
    explore: ingestion_metrics
    type: looker_pie
    fields: [ingestion_metrics.log_type, ingestion_metrics.total_size_bytes]
    filters:
      ingestion_metrics.period: This Period
    sorts: [ingestion_metrics.total_size_bytes desc]
    limit: 50
    value_labels: legend
    label_type: labPer
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Time: ingestion_metrics.period_filter
      Log Type: ingestion_metrics.log_type
    row: 3
    col: 12
    width: 12
    height: 6
  - title: Daily Log Information
    name: Daily Log Information
    explore: ingestion_metrics
    type: looker_grid
    fields: [ingestion_metrics.log_type, ingestion_metrics.timestamp_date, ingestion_metrics.total_entry_number]
    filters:
      ingestion_metrics.timestamp_time: 1 weeks
    sorts: [ingestion_metrics.timestamp_date desc]
    limit: 100
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: unstyled
    limit_displayed_rows: true
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    series_types: {}
    defaults_version: 1
    listen:
      Log Type: ingestion_metrics.log_type
    row: 24
    col: 12
    width: 12
    height: 6
  - title: Event Count vs Size (Last 24 hours)
    name: Event Count vs Size (Last 24 hours)
    explore: ingestion_metrics
    type: looker_line
    fields: [ingestion_metrics.timestamp_hour, ingestion_metrics.total_entry_number, ingestion_metrics.total_size_bytes_GiB]
    fill_fields: [ingestion_metrics.timestamp_hour]
    filters:
      ingestion_metrics.timestamp_time: 1 days
    sorts: [ingestion_metrics.timestamp_hour desc]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: ingestion_metrics.count,
            id: ingestion_metrics.count, name: Ingestion Event Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: '', orientation: right, series: [{axisId: ingestion_metrics.total_size_bytes_GiB,
            id: ingestion_metrics.total_size_bytes_GiB, name: Total Size Bytes Gib}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        type: linear}]
    x_axis_label: Hours
    hidden_series: []
    series_labels:
      ingestion_metrics.count: Ingestion Event Count
      ingestion_metrics.total_size_bytes_GiB: Ingestion Throughput
      ingestion_metrics.total_entry_number: Ingested Event Count
    defaults_version: 1
    listen:
      Log Type: ingestion_metrics.log_type
    row: 30
    col: 0
    width: 8
    height: 6
  - title: Event Count vs Size (Last 1 week)
    name: Event Count vs Size (Last 1 week)
    explore: ingestion_metrics
    type: looker_line
    fields: [ingestion_metrics.timestamp_hour, ingestion_metrics.total_entry_number, ingestion_metrics.total_size_bytes_GiB]
    fill_fields: [ingestion_metrics.timestamp_hour]
    filters:
      ingestion_metrics.timestamp_time: 7 days
    sorts: [ingestion_metrics.timestamp_hour desc]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: ingestion_metrics.count,
            id: ingestion_metrics.count, name: Ingestion Event Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: '', orientation: right, series: [{axisId: ingestion_metrics.total_size_bytes_GiB,
            id: ingestion_metrics.total_size_bytes_GiB, name: Total Size Bytes Gib}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        type: linear}]
    x_axis_label: Days
    hidden_series: []
    series_labels:
      ingestion_metrics.count: Ingestion Event Count
      ingestion_metrics.total_entry_number: Ingested Event Count
      ingestion_metrics.total_size_bytes_GiB: Ingestion Throughput
    defaults_version: 1
    listen:
      Log Type: ingestion_metrics.log_type
    row: 30
    col: 8
    width: 8
    height: 6
  - title: Event Count vs Size (Last 3 months)
    name: Event Count vs Size (Last 3 months)
    explore: ingestion_metrics
    type: looker_line
    fields: [ingestion_metrics.timestamp_month, ingestion_metrics.total_entry_number,
      ingestion_metrics.total_size_bytes_GiB]
    fill_fields: [ingestion_metrics.timestamp_month]
    filters:
      ingestion_metrics.timestamp_time: 3 months
    sorts: [ingestion_metrics.timestamp_month desc]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: ingestion_metrics.count,
            id: ingestion_metrics.count, name: Ingestion Event Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: '', orientation: right, series: [{axisId: ingestion_metrics.total_size_bytes_GiB,
            id: ingestion_metrics.total_size_bytes_GiB, name: Total Size Bytes Gib}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        type: linear}]
    x_axis_label: Months
    hidden_series: []
    series_colors:
      ingestion_metrics.total_entry_number: "#3EB0D5"
      ingestion_metrics.total_size_bytes_GiB: "#B1399E"
    series_labels:
      ingestion_metrics.count: Ingestion Event Count
      ingestion_metrics.total_size_bytes_GiB: Ingestion Throughput
      ingestion_metrics.total_entry_number: Ingested Event Count
    defaults_version: 1
    listen:
      Log Type: ingestion_metrics.log_type
    row: 30
    col: 16
    width: 8
    height: 6
  - title: Total Ingest Count
    name: Total Ingest Count
    explore: ingestion_metrics
    type: single_value
    fields: [ingestion_metrics.total_entry_number, ingestion_metrics.period]
    sorts: [ingestion_metrics.period desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: delta, label: Delta, expression: '${ingestion_metrics.total_entry_number}
          - offset(${ingestion_metrics.total_entry_number}, 1)', value_format: "#,##0,\" K\";-#,##0,\" K\"",
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: "[>=1000000000]#,##0,,,\" B\";[>=1000000]0,,\" M\";0,\" K\""
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    note_state: collapsed
    note_display: hover
    note_text: Delta compared to previous time period
    listen:
      Time: ingestion_metrics.period_filter
      Log Type: ingestion_metrics.log_type
    row: 0
    col: 7
    width: 5
    height: 3
  - title: Total Error Count
    name: Total Error Count
    explore: ingestion_metrics
    type: single_value
    fields: [ingestion_metrics.total_error_events, ingestion_metrics.period]
    sorts: [ingestion_metrics.period desc]
    limit: 500
    dynamic_fields: [{table_calculation: delta, label: Delta, expression: '${ingestion_metrics.total_error_events}
          - offset(${ingestion_metrics.total_error_events}, 1)', value_format: "#,##0.0,\" K\";-#,##0.0,\" K\"",
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: "[>=1000000000]#,##0,,,\" B\";[>=1000000]0,,\" M\";0,\" K\""
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    note_state: collapsed
    note_display: hover
    note_text: Delta compared to previous time period
    listen:
      Time: ingestion_metrics.period_filter
      Log Type: ingestion_metrics.log_type
    row: 0
    col: 19
    width: 5
    height: 3
  - name: Ingested Events Count
    type: text
    title_text: Ingested Events Count
    subtitle_text: ''
    body_text: ''
    row: 0
    col: 2
    width: 5
    height: 3
  - name: Ingestion Error Count
    type: text
    title_text: Ingestion Error Count
    subtitle_text: ''
    body_text: ''
    row: 0
    col: 14
    width: 5
    height: 3
  - title: Recently Ingested Events
    name: Recently Ingested Events
    explore: ingestion_metrics
    type: looker_grid
    fields: [ingestion_metrics.log_type, ingestion_metrics.timestamp_time]
    sorts: [ingestion_metrics.timestamp_time desc]
    limit: 100
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: unstyled
    limit_displayed_rows: true
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      ingestion_metrics.log_type: Log Type
      ingestion_metrics.timestamp_time: Timestamp
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    truncate_column_names: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Log Type: ingestion_metrics.log_type
    row: 24
    col: 0
    width: 12
    height: 6
  - title: Ingestion - Events by Status
    name: Ingestion - Events by Status
    explore: ingestion_metrics
    type: looker_line
    fields: [ingestion_metrics.total_events, ingestion_metrics.total_normalized_events,
      ingestion_metrics.total_error_events, ingestion_metrics.total_parsing_error_events,
      ingestion_metrics.total_validation_error_events, ingestion_metrics.timestamp_date]
    fill_fields: [ingestion_metrics.timestamp_date]
    filters:
      ingestion_metrics.period: This Period
    sorts: [ingestion_metrics.timestamp_date desc]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Time: ingestion_metrics.period_filter
      Log Type: ingestion_metrics.log_type
    row: 9
    col: 0
    width: 24
    height: 7
  - title: Ingestion - Events by Log Type
    name: Ingestion - Events by Log Type
    explore: ingestion_metrics
    type: looker_grid
    fields: [ingestion_metrics.log_type, ingestion_metrics.total_size_bytes, ingestion_metrics.total_events,
      ingestion_metrics.total_normalized_events, ingestion_metrics.total_error_events,
      ingestion_metrics.total_parsing_error_events, ingestion_metrics.total_validation_error_events]
    filters:
      ingestion_metrics.period: This Period
    sorts: [ingestion_metrics.total_size_bytes desc]
    limit: 100
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: unstyled
    limit_displayed_rows: true
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      ingestion_metrics.log_type: Log Type
      ingestion_metrics.total_size_bytes: Ingested Throughput
      ingestion_metrics.total_events: Ingested Events
      ingestion_metrics.total_normalized_events: Normalized Events
      ingestion_metrics.total_error_events: Errors
      ingestion_metrics.total_parsing_error_events: Parsing Errors
      ingestion_metrics.total_validation_error_events: Validation Errors
    series_cell_visualizations:
      ingestion_metrics.total_events:
        is_active: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    listen:
      Time: ingestion_metrics.period_filter
      Log Type: ingestion_metrics.log_type
    row: 16
    col: 0
    width: 24
    height: 6
  - title: Ingestion - Throughput Hourly
    name: Ingestion - Throughput Hourly
    explore: ingestion_metrics
    type: looker_area
    fields: [ingestion_metrics.log_type, ingestion_metrics.total_size_bytes, ingestion_metrics.timestamp_hour]
    pivots: [ingestion_metrics.log_type]
    fill_fields: [ingestion_metrics.timestamp_hour]
    filters:
      ingestion_metrics.timestamp_hour: 24 hours
    sorts: [ingestion_metrics.log_type, ingestion_metrics.timestamp_hour desc]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: percent
    limit_displayed_rows: true
    legend_position: right
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    y_axes: [{label: Throughput %, orientation: left, series: [{axisId: ASSET_STATIC_IP
              - ingestion_metrics.total_size_bytes, id: ASSET_STATIC_IP - ingestion_metrics.total_size_bytes,
            name: ASSET_STATIC_IP}, {axisId: CORELIGHT - ingestion_metrics.total_size_bytes,
            id: CORELIGHT - ingestion_metrics.total_size_bytes, name: CORELIGHT}, {
            axisId: ELASTIC_PACKETBEATS - ingestion_metrics.total_size_bytes, id: ELASTIC_PACKETBEATS
              - ingestion_metrics.total_size_bytes, name: ELASTIC_PACKETBEATS}, {axisId: ELASTIC_WINLOGBEAT
              - ingestion_metrics.total_size_bytes, id: ELASTIC_WINLOGBEAT - ingestion_metrics.total_size_bytes,
            name: ELASTIC_WINLOGBEAT}, {axisId: FORWARDER_HEARTBEAT - ingestion_metrics.total_size_bytes,
            id: FORWARDER_HEARTBEAT - ingestion_metrics.total_size_bytes, name: FORWARDER_HEARTBEAT},
          {axisId: GCP - ingestion_metrics.total_size_bytes, id: GCP - ingestion_metrics.total_size_bytes,
            name: GCP}, {axisId: GCP_CLOUD_NAT - ingestion_metrics.total_size_bytes,
            id: GCP_CLOUD_NAT - ingestion_metrics.total_size_bytes, name: GCP_CLOUD_NAT},
          {axisId: GCP_CSCC - ingestion_metrics.total_size_bytes, id: GCP_CSCC - ingestion_metrics.total_size_bytes,
            name: GCP_CSCC}, {axisId: GCP_DNS - ingestion_metrics.total_size_bytes,
            id: GCP_DNS - ingestion_metrics.total_size_bytes, name: GCP_DNS}, {axisId: GCP_FIREWALL
              - ingestion_metrics.total_size_bytes, id: GCP_FIREWALL - ingestion_metrics.total_size_bytes,
            name: GCP_FIREWALL}, {axisId: GCP_VPC_FLOW - ingestion_metrics.total_size_bytes,
            id: GCP_VPC_FLOW - ingestion_metrics.total_size_bytes, name: GCP_VPC_FLOW},
          {axisId: GMAIL_LOGS - ingestion_metrics.total_size_bytes, id: GMAIL_LOGS -
              ingestion_metrics.total_size_bytes, name: GMAIL_LOGS}, {axisId: GSUITE_AUDIT
              - ingestion_metrics.total_size_bytes, id: GSUITE_AUDIT - ingestion_metrics.total_size_bytes,
            name: GSUITE_AUDIT}, {axisId: LINUX_OS - ingestion_metrics.total_size_bytes,
            id: LINUX_OS - ingestion_metrics.total_size_bytes, name: LINUX_OS}, {axisId: POWERSHELL
              - ingestion_metrics.total_size_bytes, id: POWERSHELL - ingestion_metrics.total_size_bytes,
            name: POWERSHELL}, {axisId: SNORT_IDS - ingestion_metrics.total_size_bytes,
            id: SNORT_IDS - ingestion_metrics.total_size_bytes, name: SNORT_IDS}, {
            axisId: SQUID_WEBPROXY - ingestion_metrics.total_size_bytes, id: SQUID_WEBPROXY
              - ingestion_metrics.total_size_bytes, name: SQUID_WEBPROXY}, {axisId: UDM
              - ingestion_metrics.total_size_bytes, id: UDM - ingestion_metrics.total_size_bytes,
            name: UDM}, {axisId: WAZUH - ingestion_metrics.total_size_bytes, id: WAZUH
              - ingestion_metrics.total_size_bytes, name: WAZUH}, {axisId: WINDOWS_AD
              - ingestion_metrics.total_size_bytes, id: WINDOWS_AD - ingestion_metrics.total_size_bytes,
            name: WINDOWS_AD}, {axisId: WINDOWS_SYSMON - ingestion_metrics.total_size_bytes,
            id: WINDOWS_SYSMON - ingestion_metrics.total_size_bytes, name: WINDOWS_SYSMON},
          {axisId: WINEVTLOG - ingestion_metrics.total_size_bytes, id: WINEVTLOG - ingestion_metrics.total_size_bytes,
            name: WINEVTLOG}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '20'
    series_types: {}
    series_colors: {}
    series_labels:
      ingestion_metrics.log_type: Data Type
      ingestion_metrics.total_size_bytes: Ingested Throughput
      ingestion_metrics.total_events: Ingested Events
      ingestion_metrics.total_normalized_events: Normalized Events
      ingestion_metrics.total_error_events: Errors
      ingestion_metrics.total_parsing_error_events: Parsing Errors
      ingestion_metrics.total_validation_error_events: Validation Errors
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      ingestion_metrics.total_events:
        is_active: true
    table_theme: unstyled
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hide_totals: false
    hide_row_totals: false
    listen:
      Log Type: ingestion_metrics.log_type
    row: 36
    col: 0
    width: 24
    height: 7
  - title: Ingestion - Throughput Weekly
    name: Ingestion - Throughput Weekly
    explore: ingestion_metrics
    type: looker_area
    fields: [ingestion_metrics.timestamp_week, ingestion_metrics.log_type, ingestion_metrics.total_size_bytes]
    pivots: [ingestion_metrics.log_type]
    fill_fields: [ingestion_metrics.timestamp_week]
    filters:
      ingestion_metrics.timestamp_time: 7 weeks
    sorts: [ingestion_metrics.timestamp_week desc, ingestion_metrics.log_type]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: percent
    limit_displayed_rows: true
    legend_position: right
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    y_axes: [{label: Throughput %, orientation: left, series: [{axisId: ASSET_STATIC_IP
              - ingestion_metrics.total_size_bytes, id: ASSET_STATIC_IP - ingestion_metrics.total_size_bytes,
            name: ASSET_STATIC_IP}, {axisId: CORELIGHT - ingestion_metrics.total_size_bytes,
            id: CORELIGHT - ingestion_metrics.total_size_bytes, name: CORELIGHT}, {
            axisId: ELASTIC_PACKETBEATS - ingestion_metrics.total_size_bytes, id: ELASTIC_PACKETBEATS
              - ingestion_metrics.total_size_bytes, name: ELASTIC_PACKETBEATS}, {axisId: ELASTIC_WINLOGBEAT
              - ingestion_metrics.total_size_bytes, id: ELASTIC_WINLOGBEAT - ingestion_metrics.total_size_bytes,
            name: ELASTIC_WINLOGBEAT}, {axisId: FORWARDER_HEARTBEAT - ingestion_metrics.total_size_bytes,
            id: FORWARDER_HEARTBEAT - ingestion_metrics.total_size_bytes, name: FORWARDER_HEARTBEAT},
          {axisId: GCP - ingestion_metrics.total_size_bytes, id: GCP - ingestion_metrics.total_size_bytes,
            name: GCP}, {axisId: GCP_CLOUD_NAT - ingestion_metrics.total_size_bytes,
            id: GCP_CLOUD_NAT - ingestion_metrics.total_size_bytes, name: GCP_CLOUD_NAT},
          {axisId: GCP_CSCC - ingestion_metrics.total_size_bytes, id: GCP_CSCC - ingestion_metrics.total_size_bytes,
            name: GCP_CSCC}, {axisId: GCP_DNS - ingestion_metrics.total_size_bytes,
            id: GCP_DNS - ingestion_metrics.total_size_bytes, name: GCP_DNS}, {axisId: GCP_FIREWALL
              - ingestion_metrics.total_size_bytes, id: GCP_FIREWALL - ingestion_metrics.total_size_bytes,
            name: GCP_FIREWALL}, {axisId: GCP_VPC_FLOW - ingestion_metrics.total_size_bytes,
            id: GCP_VPC_FLOW - ingestion_metrics.total_size_bytes, name: GCP_VPC_FLOW},
          {axisId: GMAIL_LOGS - ingestion_metrics.total_size_bytes, id: GMAIL_LOGS -
              ingestion_metrics.total_size_bytes, name: GMAIL_LOGS}, {axisId: GSUITE_AUDIT
              - ingestion_metrics.total_size_bytes, id: GSUITE_AUDIT - ingestion_metrics.total_size_bytes,
            name: GSUITE_AUDIT}, {axisId: LINUX_OS - ingestion_metrics.total_size_bytes,
            id: LINUX_OS - ingestion_metrics.total_size_bytes, name: LINUX_OS}, {axisId: POWERSHELL
              - ingestion_metrics.total_size_bytes, id: POWERSHELL - ingestion_metrics.total_size_bytes,
            name: POWERSHELL}, {axisId: SNORT_IDS - ingestion_metrics.total_size_bytes,
            id: SNORT_IDS - ingestion_metrics.total_size_bytes, name: SNORT_IDS}, {
            axisId: SQUID_WEBPROXY - ingestion_metrics.total_size_bytes, id: SQUID_WEBPROXY
              - ingestion_metrics.total_size_bytes, name: SQUID_WEBPROXY}, {axisId: UDM
              - ingestion_metrics.total_size_bytes, id: UDM - ingestion_metrics.total_size_bytes,
            name: UDM}, {axisId: WAZUH - ingestion_metrics.total_size_bytes, id: WAZUH
              - ingestion_metrics.total_size_bytes, name: WAZUH}, {axisId: WINDOWS_AD
              - ingestion_metrics.total_size_bytes, id: WINDOWS_AD - ingestion_metrics.total_size_bytes,
            name: WINDOWS_AD}, {axisId: WINDOWS_SYSMON - ingestion_metrics.total_size_bytes,
            id: WINDOWS_SYSMON - ingestion_metrics.total_size_bytes, name: WINDOWS_SYSMON},
          {axisId: WINEVTLOG - ingestion_metrics.total_size_bytes, id: WINEVTLOG - ingestion_metrics.total_size_bytes,
            name: WINEVTLOG}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '15'
    series_types: {}
    series_colors: {}
    series_labels:
      ingestion_metrics.log_type: Data Type
      ingestion_metrics.total_size_bytes: Ingested Throughput
      ingestion_metrics.total_events: Ingested Events
      ingestion_metrics.total_normalized_events: Normalized Events
      ingestion_metrics.total_error_events: Errors
      ingestion_metrics.total_parsing_error_events: Parsing Errors
      ingestion_metrics.total_validation_error_events: Validation Errors
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      ingestion_metrics.total_events:
        is_active: true
    table_theme: unstyled
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hide_totals: false
    hide_row_totals: false
    listen:
      Log Type: ingestion_metrics.log_type
    row: 43
    col: 0
    width: 24
    height: 7
  - title: Ingestion - Throughput(Last 6 Months)
    name: Ingestion - Throughput(Last 6 Months)
    explore: ingestion_metrics
    type: looker_area
    fields: [ingestion_metrics.log_type, ingestion_metrics.total_size_bytes, ingestion_metrics.timestamp_month]
    pivots: [ingestion_metrics.log_type]
    fill_fields: [ingestion_metrics.timestamp_month]
    filters:
      ingestion_metrics.timestamp_month: 6 months
    sorts: [ingestion_metrics.log_type, ingestion_metrics.timestamp_month desc]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: percent
    limit_displayed_rows: true
    legend_position: right
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    y_axes: [{label: Throughput %, orientation: left, series: [{axisId: ASSET_STATIC_IP
              - ingestion_metrics.total_size_bytes, id: ASSET_STATIC_IP - ingestion_metrics.total_size_bytes,
            name: ASSET_STATIC_IP}, {axisId: CORELIGHT - ingestion_metrics.total_size_bytes,
            id: CORELIGHT - ingestion_metrics.total_size_bytes, name: CORELIGHT}, {
            axisId: ELASTIC_PACKETBEATS - ingestion_metrics.total_size_bytes, id: ELASTIC_PACKETBEATS
              - ingestion_metrics.total_size_bytes, name: ELASTIC_PACKETBEATS}, {axisId: ELASTIC_WINLOGBEAT
              - ingestion_metrics.total_size_bytes, id: ELASTIC_WINLOGBEAT - ingestion_metrics.total_size_bytes,
            name: ELASTIC_WINLOGBEAT}, {axisId: FORWARDER_HEARTBEAT - ingestion_metrics.total_size_bytes,
            id: FORWARDER_HEARTBEAT - ingestion_metrics.total_size_bytes, name: FORWARDER_HEARTBEAT},
          {axisId: GCP - ingestion_metrics.total_size_bytes, id: GCP - ingestion_metrics.total_size_bytes,
            name: GCP}, {axisId: GCP_CLOUD_NAT - ingestion_metrics.total_size_bytes,
            id: GCP_CLOUD_NAT - ingestion_metrics.total_size_bytes, name: GCP_CLOUD_NAT},
          {axisId: GCP_CSCC - ingestion_metrics.total_size_bytes, id: GCP_CSCC - ingestion_metrics.total_size_bytes,
            name: GCP_CSCC}, {axisId: GCP_DNS - ingestion_metrics.total_size_bytes,
            id: GCP_DNS - ingestion_metrics.total_size_bytes, name: GCP_DNS}, {axisId: GCP_FIREWALL
              - ingestion_metrics.total_size_bytes, id: GCP_FIREWALL - ingestion_metrics.total_size_bytes,
            name: GCP_FIREWALL}, {axisId: GCP_VPC_FLOW - ingestion_metrics.total_size_bytes,
            id: GCP_VPC_FLOW - ingestion_metrics.total_size_bytes, name: GCP_VPC_FLOW},
          {axisId: GMAIL_LOGS - ingestion_metrics.total_size_bytes, id: GMAIL_LOGS -
              ingestion_metrics.total_size_bytes, name: GMAIL_LOGS}, {axisId: GSUITE_AUDIT
              - ingestion_metrics.total_size_bytes, id: GSUITE_AUDIT - ingestion_metrics.total_size_bytes,
            name: GSUITE_AUDIT}, {axisId: LINUX_OS - ingestion_metrics.total_size_bytes,
            id: LINUX_OS - ingestion_metrics.total_size_bytes, name: LINUX_OS}, {axisId: POWERSHELL
              - ingestion_metrics.total_size_bytes, id: POWERSHELL - ingestion_metrics.total_size_bytes,
            name: POWERSHELL}, {axisId: SNORT_IDS - ingestion_metrics.total_size_bytes,
            id: SNORT_IDS - ingestion_metrics.total_size_bytes, name: SNORT_IDS}, {
            axisId: SQUID_WEBPROXY - ingestion_metrics.total_size_bytes, id: SQUID_WEBPROXY
              - ingestion_metrics.total_size_bytes, name: SQUID_WEBPROXY}, {axisId: UDM
              - ingestion_metrics.total_size_bytes, id: UDM - ingestion_metrics.total_size_bytes,
            name: UDM}, {axisId: WAZUH - ingestion_metrics.total_size_bytes, id: WAZUH
              - ingestion_metrics.total_size_bytes, name: WAZUH}, {axisId: WINDOWS_AD
              - ingestion_metrics.total_size_bytes, id: WINDOWS_AD - ingestion_metrics.total_size_bytes,
            name: WINDOWS_AD}, {axisId: WINDOWS_SYSMON - ingestion_metrics.total_size_bytes,
            id: WINDOWS_SYSMON - ingestion_metrics.total_size_bytes, name: WINDOWS_SYSMON},
          {axisId: WINEVTLOG - ingestion_metrics.total_size_bytes, id: WINEVTLOG - ingestion_metrics.total_size_bytes,
            name: WINEVTLOG}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '15'
    series_types: {}
    series_colors: {}
    series_labels:
      ingestion_metrics.log_type: Data Type
      ingestion_metrics.total_size_bytes: Ingested Throughput
      ingestion_metrics.total_events: Ingested Events
      ingestion_metrics.total_normalized_events: Normalized Events
      ingestion_metrics.total_error_events: Errors
      ingestion_metrics.total_parsing_error_events: Parsing Errors
      ingestion_metrics.total_validation_error_events: Validation Errors
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      ingestion_metrics.total_events:
        is_active: true
    table_theme: unstyled
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hide_totals: false
    hide_row_totals: false
    listen:
      Log Type: ingestion_metrics.log_type
    row: 50
    col: 0
    width: 24
    height: 7
  - title: Ingestion - Throughput(All Time)
    name: Ingestion - Throughput(All Time)
    explore: ingestion_metrics
    type: looker_area
    fields: [ingestion_metrics.log_type, ingestion_metrics.total_size_bytes, ingestion_metrics.timestamp_year]
    pivots: [ingestion_metrics.log_type]
    fill_fields: [ingestion_metrics.timestamp_year]
    sorts: [ingestion_metrics.log_type, ingestion_metrics.timestamp_year desc]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: percent
    limit_displayed_rows: true
    legend_position: right
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    y_axes: [{label: Throughput %, orientation: left, series: [{axisId: ASSET_STATIC_IP
              - ingestion_metrics.total_size_bytes, id: ASSET_STATIC_IP - ingestion_metrics.total_size_bytes,
            name: ASSET_STATIC_IP}, {axisId: CORELIGHT - ingestion_metrics.total_size_bytes,
            id: CORELIGHT - ingestion_metrics.total_size_bytes, name: CORELIGHT}, {
            axisId: ELASTIC_PACKETBEATS - ingestion_metrics.total_size_bytes, id: ELASTIC_PACKETBEATS
              - ingestion_metrics.total_size_bytes, name: ELASTIC_PACKETBEATS}, {axisId: ELASTIC_WINLOGBEAT
              - ingestion_metrics.total_size_bytes, id: ELASTIC_WINLOGBEAT - ingestion_metrics.total_size_bytes,
            name: ELASTIC_WINLOGBEAT}, {axisId: FORWARDER_HEARTBEAT - ingestion_metrics.total_size_bytes,
            id: FORWARDER_HEARTBEAT - ingestion_metrics.total_size_bytes, name: FORWARDER_HEARTBEAT},
          {axisId: GCP - ingestion_metrics.total_size_bytes, id: GCP - ingestion_metrics.total_size_bytes,
            name: GCP}, {axisId: GCP_CLOUD_NAT - ingestion_metrics.total_size_bytes,
            id: GCP_CLOUD_NAT - ingestion_metrics.total_size_bytes, name: GCP_CLOUD_NAT},
          {axisId: GCP_CSCC - ingestion_metrics.total_size_bytes, id: GCP_CSCC - ingestion_metrics.total_size_bytes,
            name: GCP_CSCC}, {axisId: GCP_DNS - ingestion_metrics.total_size_bytes,
            id: GCP_DNS - ingestion_metrics.total_size_bytes, name: GCP_DNS}, {axisId: GCP_FIREWALL
              - ingestion_metrics.total_size_bytes, id: GCP_FIREWALL - ingestion_metrics.total_size_bytes,
            name: GCP_FIREWALL}, {axisId: GCP_VPC_FLOW - ingestion_metrics.total_size_bytes,
            id: GCP_VPC_FLOW - ingestion_metrics.total_size_bytes, name: GCP_VPC_FLOW},
          {axisId: GMAIL_LOGS - ingestion_metrics.total_size_bytes, id: GMAIL_LOGS -
              ingestion_metrics.total_size_bytes, name: GMAIL_LOGS}, {axisId: GSUITE_AUDIT
              - ingestion_metrics.total_size_bytes, id: GSUITE_AUDIT - ingestion_metrics.total_size_bytes,
            name: GSUITE_AUDIT}, {axisId: LINUX_OS - ingestion_metrics.total_size_bytes,
            id: LINUX_OS - ingestion_metrics.total_size_bytes, name: LINUX_OS}, {axisId: POWERSHELL
              - ingestion_metrics.total_size_bytes, id: POWERSHELL - ingestion_metrics.total_size_bytes,
            name: POWERSHELL}, {axisId: SNORT_IDS - ingestion_metrics.total_size_bytes,
            id: SNORT_IDS - ingestion_metrics.total_size_bytes, name: SNORT_IDS}, {
            axisId: SQUID_WEBPROXY - ingestion_metrics.total_size_bytes, id: SQUID_WEBPROXY
              - ingestion_metrics.total_size_bytes, name: SQUID_WEBPROXY}, {axisId: UDM
              - ingestion_metrics.total_size_bytes, id: UDM - ingestion_metrics.total_size_bytes,
            name: UDM}, {axisId: WAZUH - ingestion_metrics.total_size_bytes, id: WAZUH
              - ingestion_metrics.total_size_bytes, name: WAZUH}, {axisId: WINDOWS_AD
              - ingestion_metrics.total_size_bytes, id: WINDOWS_AD - ingestion_metrics.total_size_bytes,
            name: WINDOWS_AD}, {axisId: WINDOWS_SYSMON - ingestion_metrics.total_size_bytes,
            id: WINDOWS_SYSMON - ingestion_metrics.total_size_bytes, name: WINDOWS_SYSMON},
          {axisId: WINEVTLOG - ingestion_metrics.total_size_bytes, id: WINEVTLOG - ingestion_metrics.total_size_bytes,
            name: WINEVTLOG}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '15'
    series_types: {}
    series_colors: {}
    series_labels:
      ingestion_metrics.log_type: Data Type
      ingestion_metrics.total_size_bytes: Ingested Throughput
      ingestion_metrics.total_events: Ingested Events
      ingestion_metrics.total_normalized_events: Normalized Events
      ingestion_metrics.total_error_events: Errors
      ingestion_metrics.total_parsing_error_events: Parsing Errors
      ingestion_metrics.total_validation_error_events: Validation Errors
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      ingestion_metrics.total_events:
        is_active: true
    table_theme: unstyled
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hide_totals: false
    hide_row_totals: false
    listen:
      Log Type: ingestion_metrics.log_type
    row: 57
    col: 0
    width: 24
    height: 7
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '**Please note that the dashboards below have timelines that are pre-selected
      and the "Time" filter doesn''t apply to them**'
    row: 22
    col: 0
    width: 24
    height: 2
  filters:
  - name: Time
    title: Time
    type: field_filter
    default_value: 7 days
    allow_multiple_values: true
    required: true
    ui_config:
      type: advanced
      display: popover
      options: []
    explore: ingestion_metrics
    listens_to_filters: []
    field: ingestion_metrics.period_filter
  - name: Log Type
    title: Log Type
    type: field_filter
    default_value: "-NULL"
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    explore: ingestion_metrics
    listens_to_filters: []
    field: ingestion_metrics.log_type
