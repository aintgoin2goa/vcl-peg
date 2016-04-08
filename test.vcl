backend next_us_test {
  .connect_timeout = 1s;
  .dynamic = true;
  .port = "80";
  .host = "us-ft-next-sample.herokuapp.com";
  .host_header = "us-ft-next-sample.herokuapp.com";
  .first_byte_timeout = 15s;
  .max_connections = 200;
  .between_bytes_timeout = 10s;
  .share_key = "f8585BOxnGQDMbnkJoM1e";

  .probe = {
    .request = "HEAD /__gtg HTTP/1.1" "Host: us-ft-next-sample.herokuapp.com" "Connection: close" "User-Agent: Varnish/fastly (healthcheck)";
    .threshold = 1;
    .window = 2;
    .timeout = 5s;
    .initial = 1;
    .expected_response = 200;
    .interval = 10s;
  }
}

backend next_eu_test {
  .connect_timeout = 1s;
  .dynamic = true;
  .port = "80";
  .host = "eu-ft-next-sample.herokuapp.com";
  .host_header = "eu-ft-next-sample.herokuapp.com";
  .first_byte_timeout = 15s;
  .max_connections = 200;
  .between_bytes_timeout = 10s;
  .share_key = "f8585BOxnGQDMbnkJoM1e";

  .probe = {
    .request = "HEAD /__gtg HTTP/1.1" "Host: eu-ft-next-sample.herokuapp.com" "Connection: close" "User-Agent: Varnish/fastly (healthcheck)";
    .threshold = 1;
    .window = 2;
    .timeout = 5s;
    .initial = 1;
    .expected_response = 200;
    .interval = 10s;
  }
}

backend next_eu_router {
  .connect_timeout = 3s;
  .dynamic = true;
  .port = "80";
  .host = "ft-next-router-v003.herokuapp.com";
  .host_header = "ft-next-router-v003.herokuapp.com";
  .first_byte_timeout = 15s;
  .max_connections = 200;
  .between_bytes_timeout = 10s;
  .share_key = "f8585BOxnGQDMbnkJoM1e";

  .probe = {
    .request = "HEAD /__gtg HTTP/1.1" "Host: ft-next-router-v003.herokuapp.com" "Connection: close" "User-Agent: Varnish/fastly (healthcheck)";
    .threshold = 1;
    .window = 2;
    .timeout = 5s;
    .initial = 1;
    .expected_response = 200;
    .interval = 10s;
  }
}

backend next_us_router {
  .connect_timeout = 3s;
  .dynamic = true;
  .port = "80";
  .host = "ft-next-router-v003-us.herokuapp.com";
  .host_header = "ft-next-router-v003-us.herokuapp.com";
  .first_byte_timeout = 15s;
  .max_connections = 200;
  .between_bytes_timeout = 10s;
  .share_key = "f8585BOxnGQDMbnkJoM1e";

  .probe = {
    .request = "HEAD /__gtg HTTP/1.1" "Host: ft-next-router-v003-us.herokuapp.com" "Connection: close" "User-Agent: Varnish/fastly (healthcheck)";
    .threshold = 1;
    .window = 2;
    .timeout = 5s;
    .initial = 1;
    .expected_response = 200;
    .interval = 10s;
  }
}
