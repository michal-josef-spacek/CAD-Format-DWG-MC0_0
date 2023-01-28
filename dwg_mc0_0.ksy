meta:
  id: dwg_0000
  title: AutoCAD drawing (MC0.0)
  application: AutoCAD
  file-extension:
    - dwg
  license: CC0-1.0
  xref:
    justsolve: DWG
    pronom:
      fmt: 21
    mime:
      - application/x-dwg
      - image/vnd.dwg
    wikidata: Q27863105
  endian: le
seq:
  - id: header
    type: header
  - id: entities
    type: entity
    repeat: expr
    repeat-expr: header.number_of_entities
types:
  header:
    seq:
      - id: magic
        contents: [0x4d, 0x43, 0x30, 0x2e, 0x30, 0x00]
      - id: zeros
        size: 6
      - id: insertion_base
        type: point_3d
        doc: 0x000c-0x0023
      - id: number_of_bytes
        type: s4
      - id: number_of_entities
        type: s2
        doc: 0x0028-0x0029
      - id: drawing_first
        type: point_3d
      - id: drawing_second
        type: point_3d
      - id: limits_min
        type: point_2d
        doc: 0x005a-0x0069
      - id: limits_max
        type: point_2d
        doc: 0x006a-0x0079
      - id: view_ctrl
        type: point_3d
      - id: view_size
        type: f8
      - id: snap
        type: s2
        doc: 0x009a-0x009b
      - id: snap_resolution
        type: f8
        doc: 0x009c-0x00a3
      - id: grid
        type: s2
        doc: 0x00a4-0x00a5
      - id: grid_unit
        type: f8
        doc: 0x00a6-0x00ad
      - id: ortho
        type: s2
        doc: 0x00ae-0x00af
      - id: regen
        type: s2
        doc: 0x00b0-0x00b1 (XXX could be ffff)
      - id: fill
        type: s2
        doc: 0x00b2-0x00b3 (XXX could be ffff)
      - id: text_size
        type: f8
      - id: trace_width
        type: f8
      - id: current_layer
        type: s2
        doc: 0x00c4-0x00c5
      - id: current_color
        type: s2
        doc: 0x00c6-0x00c7
      - id: layers
        type: s2
        repeat: expr
        repeat-expr: 128
        doc: 0x00c8-0x01c7
  entity:
    seq:
      - id: entity_common
        type: entity_common
      - id: data
        type:
          switch-on: entity_common.entity_type
          cases:
            'entities::arc': entity_arc
            'entities::block_begin': entity_block_begin
            # 'entities::block_end': entity_block_end
            'entities::insert' : entity_insert
            'entities::circle': entity_circle
            'entities::line': entity_line
            'entities::load': entity_load
            'entities::point': entity_point
            # 'entities::repeat_begin': entity_repeat_begin
            'entities::repeat_end': entity_repeat_end
            'entities::shape': entity_shape
            'entities::solid': entity_solid
            'entities::text': entity_text
            'entities::trace': entity_trace
            'entities::tmp_arc': entity_arc
            'entities::tmp_insert' : entity_insert
            'entities::tmp_circle': entity_circle
            'entities::tmp_line': entity_line
            'entities::tmp_point': entity_point
            'entities::tmp_shape': entity_shape
            'entities::tmp_solid': entity_solid
            'entities::tmp_text': entity_text
            'entities::tmp_trace': entity_trace
    types:
      entity_common:
        seq:
          - id: entity_type
            type: s1
            enum: entities
          - id: flag
            type: s1
          - id: layer
            type: s1
          - id: flag2
            type: s1
      entity_arc:
        seq:
          - id: x
            type: f8
          - id: y
            type: f8
          - id: radius
            type: f8
          - id: angle_from
            type: f8
          - id: angle_to
            type: f8
      entity_block_begin:
        seq:
          - id: name_size
            type: s2
          - id: name
            size: name_size
            type: str
            encoding: ASCII
            terminator: 0x00
          - id: x
            type: f8
          - id: y
            type: f8
      entity_insert:
        seq:
          - id: size
            type: s2
          - id: value
            size: size
            type: str
            encoding: ASCII
            terminator: 0x00
          - id: x
            type: f8
          - id: y
            type: f8
          - id: x_scale
            type: f8
          - id: y_scale
            type: f8
          - id: rotation_angle
            type: f8
      entity_circle:
        seq:
          - id: x
            type: f8
          - id: y
            type: f8
          - id: radius
            type: f8
      entity_line:
        seq:
          - id: x1
            type: f8
          - id: y1
            type: f8
          - id: x2
            type: f8
          - id: y2
            type: f8
      entity_load:
        seq:
          - id: size
            type: s2
          - id: value
            size: size
            type: str
            encoding: ASCII
            terminator: 0x00
      entity_point:
        seq:
          - id: x
            type: f8
          - id: y
            type: f8
      entity_repeat_end:
        seq:
          - id: columns
            type: s2
          - id: rows
            type: s2
          - id: column_distance
            type: f8
          - id: row_distance
            type: f8
      entity_shape:
        seq:
          - id: x
            type: f8
          - id: y
            type: f8
          - id: height
            type: f8
          - id: angle
            type: f8
          - id: item_num
            type: s2
      entity_solid:
        seq:
          - id: corner1
            type: point_2d
          - id: corner2
            type: point_2d
          - id: corner3
            type: point_2d
          - id: corner4
            type: point_2d
      entity_text:
        seq:
          - id: x
            type: f8
          - id: y
            type: f8
          - id: height
            type: f8
          - id: angle
            type: f8
          - id: size
            type: s2
          - id: value
            size: size
            type: str
            encoding: ASCII
            terminator: 0x00
      entity_trace:
        seq:
          - id: corner1
            type: point_2d
          - id: corner2
            type: point_2d
          - id: corner3
            type: point_2d
          - id: corner4
            type: point_2d
  point_2d:
    seq:
      - id: x
        type: f8
      - id: y
        type: f8
  point_3d:
    seq:
      - id: x
        type: f8
      - id: y
        type: f8
      - id: z
        type: f8
enums:
  entities:
    -1: tmp_line
    -2: tmp_point
    -3: tmp_circle
    -4: tmp_shape
    -7: tmp_text
    -8: tmp_arc
    -9: tmp_trace
    -11: tmp_solid
    -14: tmp_insert
    1: line
    2: point
    3: circle
    4: shape
    5: repeat_begin
    6: repeat_end
    7: text
    8: arc
    9: trace
    10: load
    11: solid
    12: block_begin
    13: block_end
    14: insert
  unit_types:
    1: scientific
    2: decimal
    3: engineering
    4: architectural
