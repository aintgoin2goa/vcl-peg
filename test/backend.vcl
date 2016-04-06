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

  .probe = {
    .request = "HEAD /itm/site_status.html HTTP/1.1" "Host: render.prod.ft.com" "Connection: close" "User-Agent: Varnish/fastly (healthcheck)";
    .threshold = 1;
    .window = 2;
    .timeout = 5s;
    .initial = 1;
    .expected_response = 200;
    .interval = 10s;
  }
}