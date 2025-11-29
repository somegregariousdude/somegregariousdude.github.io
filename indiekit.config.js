import { Indiekit } from "@indiekit/indiekit";
import { GithubStore } from "@indiekit/store-github";
import { MastodonSyndicator } from "@indiekit/syndicator-mastodon";
import { HugoPreset } from "@indiekit/preset-hugo";

const indiekit = new Indiekit();

// 1. CONFIGURE PLUGINS
const github = new GithubStore({
  user: process.env.GITHUB_USER,
  repo: process.env.GITHUB_REPO,
  branch: process.env.GITHUB_BRANCH,
  token: process.env.GITHUB_TOKEN,
});

const mastodon = new MastodonSyndicator({
  url: process.env.MASTODON_URL,
  user: process.env.MASTODON_USER,
  accessToken: process.env.MASTODON_ACCESS_TOKEN,
});

const hugo = new HugoPreset();

// 2. DEFINE POST TYPES (Universal Leaf Bundle Mapping)
// Logic: 
// - Timestamp Path: {yyyy}-{MM}-{dd}-{HH}{mm} (Status, Reply, Like, Repost, RSVP)
// - Slug Path: {slug} (Article, Photo, Bookmark)
// - Media Path: Always matches the Post path.

const postTypes = [
  {
    type: "note",
    name: "Status Update",
    post: {
      path: "content/status/{yyyy}-{MM}-{dd}-{HH}{mm}/index.md",
      url: "status/{yyyy}-{MM}-{dd}/{slug}",
    },
    media: {
      path: "content/status/{yyyy}-{MM}-{dd}-{HH}{mm}/{filename}",
    }
  },
  {
    type: "reply",
    name: "Reply",
    post: {
      path: "content/replies/{yyyy}-{MM}-{dd}-{HH}{mm}/index.md",
      url: "replies/{yyyy}-{MM}-{dd}/{slug}",
    },
    media: {
      path: "content/replies/{yyyy}-{MM}-{dd}-{HH}{mm}/{filename}",
    }
  },
  {
    type: "like",
    name: "Like",
    post: {
      path: "content/likes/{yyyy}-{MM}-{dd}-{HH}{mm}/index.md",
      url: "likes/{yyyy}-{MM}-{dd}/{slug}",
    },
    media: {
      path: "content/likes/{yyyy}-{MM}-{dd}-{HH}{mm}/{filename}",
    }
  },
  {
    type: "repost",
    name: "Repost",
    post: {
      path: "content/reposts/{yyyy}-{MM}-{dd}-{HH}{mm}/index.md",
      url: "reposts/{yyyy}-{MM}-{dd}/{slug}",
    },
    media: {
      path: "content/reposts/{yyyy}-{MM}-{dd}-{HH}{mm}/{filename}",
    }
  },
  {
    type: "rsvp",
    name: "RSVP",
    post: {
      path: "content/rsvps/{yyyy}-{MM}-{dd}-{HH}{mm}/index.md",
      url: "rsvps/{yyyy}-{MM}-{dd}/{slug}",
    },
    media: {
      path: "content/rsvps/{yyyy}-{MM}-{dd}-{HH}{mm}/{filename}",
    }
  },
  {
    type: "article",
    name: "Article",
    post: {
      path: "content/articles/{slug}/index.md",
      url: "articles/{yyyy}-{MM}-{dd}/{slug}",
    },
    media: {
      path: "content/articles/{slug}/{filename}",
    }
  },
  {
    type: "photo",
    name: "Photo",
    post: {
      path: "content/photos/{slug}/index.md",
      url: "photos/{yyyy}-{MM}-{dd}/{slug}",
    },
    media: {
      path: "content/photos/{slug}/{filename}",
    }
  },
  {
    type: "bookmark",
    name: "Bookmark",
    post: {
      path: "content/bookmarks/{slug}/index.md",
      url: "bookmarks/{yyyy}-{MM}-{dd}/{slug}",
    },
    media: {
      path: "content/bookmarks/{slug}/{filename}",
    }
  }
];

// 3. APPLY CONFIGURATION
indiekit.set("publication.me", "https://simplygregario.us");
indiekit.set("publication.postTypes", postTypes);
indiekit.set("publication.syndicationTargets", [
  {
    uid: "https://dragonscave.space",
    name: "Mastodon",
    service: "mastodon",
    user: process.env.MASTODON_USER,
  }
]);

indiekit.addStore(github);
indiekit.addSyndicator(mastodon);
indiekit.addPreset(hugo);

export default indiekit;
