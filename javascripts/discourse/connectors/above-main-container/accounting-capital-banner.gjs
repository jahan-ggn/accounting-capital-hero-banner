import { concat } from "@ember/helper";
import { trustHTML } from "@ember/template";
import SearchMenu from "discourse/components/search-menu";

const AccountingCapitalBanner = <template>
  <div class="hero-banner">
    <div class="hero-banner-box">
      <div class="hero-container">
        <div class="hero-section-header">
          {{trustHTML settings.hero_heading}}
          <span>{{trustHTML settings.hero_subtext}}</span>
          <SearchMenu />
        </div>

        <div
          class="hero-image"
          style={{if
            settings.hero_image
            (concat "background-image: url(" settings.hero_image ");")
          }}
        ></div>
      </div>
    </div>
  </div>
</template>;

export default AccountingCapitalBanner;
