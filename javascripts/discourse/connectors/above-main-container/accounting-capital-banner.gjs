import Component from "@glimmer/component";
import { concat } from "@ember/helper";
import { service } from "@ember/service";
import { trustHTML } from "@ember/template";
import SearchMenu from "discourse/components/search-menu";

export default class HeroBanner extends Component {
  @service router;

  get shouldDisplay() {
    const route = this.router.currentRouteName;

    if (!route) {
      return false;
    }

    if (route.startsWith("admin")) {
      return false;
    }

    if (
      route.includes("login") ||
      route.includes("signup") ||
      route.includes("password-reset")
    ) {
      return false;
    }

    if (route.startsWith("user.")) {
      return false;
    }

    return !!(
      settings.hero_heading ||
      settings.hero_subtext ||
      settings.hero_image
    );
  }

  <template>
    {{#if this.shouldDisplay}}
      <div class="hero-banner">
        <div class="hero-banner-box">
          <div class="hero-container">

            <div class="hero-section-header">
              {{#if settings.hero_heading}}
                {{trustHTML settings.hero_heading}}
              {{/if}}
              {{#if settings.hero_subtext}}
                <span>{{trustHTML settings.hero_subtext}}</span>
              {{/if}}
              <SearchMenu />
            </div>

            {{#if settings.hero_image}}
              <div
                class="hero-image"
                style={{trustHTML
                  (concat "background-image: url(" settings.hero_image ")")
                }}
              />
            {{/if}}

          </div>
        </div>
      </div>
    {{/if}}
  </template>
}
