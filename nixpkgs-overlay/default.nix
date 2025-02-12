self: super:
rec {
  /*
  lucenepp = (super.lucenepp.override {
    boost = super.boost186;
  }).overrideAttrs ( old : {
    patches = old.patches ++ [
      (self.fetchpatch {
        name = "migrate-to-boost_asio_io_context.patch";
        url = "https://github.com/luceneplusplus/LucenePlusPlus/commit/e6a376836e5c891577eae6369263152106b9bc02.patch";
        hash = "sha256-0mdVvrS0nTxSJXRzVdx2Zb/vm9aVxGfARG/QliRx7tA=";
      })
    ];
    doCheck = false;
  });
  dde-grand-search = super.dde-grand-search.override {
    boost = super.boost186;
  };
  dde-file-manager = super.dde-file-manager.override {
    boost = super.boost186;
    };
   */
}
