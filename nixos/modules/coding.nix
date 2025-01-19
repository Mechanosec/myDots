{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    tmux
    yazi
    fzf
    ripgrep
    gcc
    nodejs_20
    lazygit
    lazydocker
    prisma-engines
    go

    postman
    dbeaver-bin
    vscode
    slack
    obsidian
    telegram-desktop
  ];

  virtualisation.docker.enable = true;

  environment.sessionVariables = {
    PRISMA_QUERY_ENGINE_LIBRARY = "${pkgs.prisma-engines}/lib/libquery_engine.node";
    PRISMA_QUERY_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/query-engine";
    PRISMA_SCHEMA_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/schema-engine";
    PRISMA_ENGINES_CHECKSUM_IGNORE_MISSING = "1";
  };
}
