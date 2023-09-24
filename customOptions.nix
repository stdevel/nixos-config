{lib,...}:{

options.my.highDPI = lib.mkOption {
  description = "If the device has a high DPI screen";
  default = false;
  type = lib.types.bool;
  };
}
