backend falcon {
  .connect_timeout = 3s;
  .dynamic = true;
  .port = "80";
  .host = "render.prod.ft.com";
  .host_header = "www.ft.com";
  .first_byte_timeout = 15s;
  .max_connections = 200;
  .between_bytes_timeout = 10s;
  .share_key = "f8585BOxnGQDMbnkJoM1e";


}