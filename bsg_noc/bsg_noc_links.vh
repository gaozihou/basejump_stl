`ifndef BSG_NOC_LINKS_VH
 `define BSG_NOC_LINKS_VH

// aka ready & valid
`define bsg_ready_and_link_sif_width(in_data_width) (in_data_width+2)

// aka ready->valid
`define bsg_ready_then_link_sif_width(in_data_width) ((in_data_width)+2)

// aka valid->ready
`define bsg_then_ready_link_sif_width(in_data_width) ((in_data_width)+2)

`define declare_bsg_ready_and_link_sif_s(in_data_width,in_struct_name)    \
   typedef struct packed {                                                \
      logic       v;                                                      \
      logic       ready_and_rev;                                          \
      logic [in_data_width-1:0] data;                                     \
  } in_struct_name

`define declare_bsg_ready_then_link_sif_s(in_data_width,in_struct_name)   \
   typedef struct packed {                                                \
      logic       v;                                                      \
      logic       ready_then_rev;                                         \
      logic [in_data_width-1:0] data;                                     \
  } in_struct_name

`define declare_bsg_then_ready_link_sif_s(in_data_width,in_struct_name)\
   typedef struct packed {                                                \
      logic       v;                                                      \
      logic       then_ready_rev;                                         \
      logic [in_data_width-1:0] data;                                     \
  } in_struct_name


// bsg_noc_wormhole
`define bsg_wormhole_packet_width(reserved_width, x_cord_width, y_cord_width, len_width, data_width) \
  (reserved_width+x_cord_width+y_cord_width+len_width+data_width)
 
`define declare_bsg_wormhole_packet_s(width, reserved_width, x_cord_width, y_cord_width, len_width, in_struct_name) \
  typedef struct packed {                                                      \
    logic [width-reserved_width-x_cord_width-y_cord_width-len_width-1:0] data; \
    logic [reserved_width-1:0] reserved;                                       \
    logic [len_width-1:0]      len;                                            \
    logic [y_cord_width-1:0]   y_cord;                                         \
    logic [x_cord_width-1:0]   x_cord;                                         \
  } in_struct_name
  
`define declare_bsg_channel_tunnel_wormhole_packet_s(width, reserved_width, x_cord_width, y_cord_width, len_width, in_struct_name) \
  typedef struct packed {                                                      \
    logic [reserved_width-1:0] reserved;                                       \
    logic [width-reserved_width-x_cord_width-y_cord_width-len_width-1:0] data; \
    logic [len_width-1:0]      len;                                            \
    logic [y_cord_width-1:0]   y_cord;                                         \
    logic [x_cord_width-1:0]   x_cord;                                         \
  } in_struct_name

 `endif // BSG_NOC_LINKS_VH
