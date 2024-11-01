{mkPlugin, ...}: {
  plugins.rainbow-delimiters = {
    enable = true;
    strategy = {
      default = "global";
    };
    query = {
      default = "rainbow-delimiters";
      lua = "rainbow-blocks";
    };
    highlight = [
      #"RainbowRed"
      #"RainbowYellow"
      #"RainbowBlue"
      #"RainbowOrange"
      #"RainbowGreen"
      #"RainbowViolet"
      #"RainbowCyan"
      "RainbowDelimiterRed"
      "RainbowDelimiterYellow"
      "RainbowDelimiterBlue"
      "RainbowDelimiterOrange"
      "RainbowDelimiterGreen"
      "RainbowDelimiterViolet"
      "RainbowDelimiterCyan"
    ];
  };
}
