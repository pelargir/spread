require 'spread'
require 'spread/controller'
require 'spread/asset_copier'

if RAILS_ENV == "development"
  Spread::AssetCopier.copy "spread"
else
  Spread::AssetCopier.warn "spread"
end