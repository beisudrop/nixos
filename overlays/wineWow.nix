nixpkgs-2511: final: prev: {
     wineWowPackages = import nixpkgs-2511 {
       system = final.system;
     };
   }
