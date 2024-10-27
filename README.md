<!-- markdownlint-disable-next-line -->
<div align="center">

  <!-- markdownlint-disable-next-line -->
  # linkyee - Your Own Link Pages

  A fully customized, open-source LinkTree alternative deployed directly on GitHub Pages.

  Inspired by Jekyllrb and LinkTree.

  [![Automatic build](../../actions/workflows/build.yml/badge.svg)](../../actions/workflows/build.yml) [![pages-build-deployment](../../actions/workflows/pages/pages-build-deployment/badge.svg)](../../actions/workflows/pages/pages-build-deployment)

  [**Live Demo**→](http://link.zhgchg.li/)

  ![linkyee](https://github.com/user-attachments/assets/66e01d38-36bf-4cfc-8461-968947f5712c)

</div>

- [Features](https://github.com/ZhgChgLi/linkyee/edit/main/README.md#features)
- [Get Started – Deploy on GitHub Pages](https://github.com/ZhgChgLi/linkyee/edit/main/README.md#get-started--deploy-on-github-pages)
- [Configuration & Customized & Automatic Redeployment](https://github.com/ZhgChgLi/linkyee/edit/main/README.md#configuration)
- [Custom Domain](https://en.zhgchg.li/posts/483af5d93297/)

## Features

- 100% Customized
- 100% Free
- Supports plugins and dynamic variable injection (e.g., displaying current Medium follower count, GitHub repo stars)
- Deployed directly on GitHub Pages
- SEO and performance optimization
- Theme switching and custom themes supported (the default theme is generated by ChatGPT :\))

### Buy me a coffee ❤️❤️❤️

<a href="https://www.buymeacoffee.com/zhgchgli" target="_blank"><img width="545" alt="bmc-button" src="https://github.com/user-attachments/assets/5983bfc9-27fd-49e0-a7f4-eb07657c6e31"></a>

[**If this project has helped you, please consider starring the repo, recommending it to your friends, or sponsoring me a cup of coffee. Thank you for your support!**](https://www.buymeacoffee.com/zhgchgli)

Feel free to open an issue or submit a fix/contribution via pull request. :)

## Get Started – Deploy on GitHub Pages
### About Github Pages
> GitHub Pages is a free hosting service provided by GitHub, designed for creating and publishing websites directly from a GitHub repository. It allows developers, designers, and anyone with a GitHub account to host personal, project, or organizational websites without needing external hosting services. GitHub Pages works seamlessly with GitHub repositories, automatically generating a static website whenever new content is pushed.

#### Step 1. Click the “Use this template” button at the top-right corner of the [linkyee](https://github.com/ZhgChgLi/linkyee) Template Repo -> “Create a new repository”:
![image](https://github.com/user-attachments/assets/4b88da62-df4b-4f3b-a22c-e78b7527a92d)

#### Step 2. Check “Include all branches,” enter your desired GitHub Pages repo name, and click “Create repository” once finished:
![image](https://github.com/user-attachments/assets/d3611204-7507-41a1-8221-707200a3e269)

> The GitHub Pages repo name will affect the access URL. If you enter `your-username.github.io` as the Repo Name, that will be the direct URL to your GitHub Pages site.
> If you already have a `your-username.github.io` repo, the GitHub Pages URL will be `your-username.github.io/Repo-Name`.

#### Wait for the fork to complete. You might encounter deployment errors during the initial setup due to forked repo permission issues. Let’s proceed with the steps to adjust this.
![image](https://github.com/user-attachments/assets/038fac9e-83eb-4f2f-ba9a-88712b4af022)

#### Step 4. Go to Settings -> Actions -> General, ensure the following options are selected:
![image](https://github.com/user-attachments/assets/6851c4e6-9466-4800-862f-e9e5e5b65b11)

- Actions permissions: `Allow all actions and reusable workflows`
- Workflow permissions: `Read and write permissions`

After selecting, click the Save button to save your changes.

#### Step 5. Go to Settings -> Pages and ensure the selected branch for GitHub Pages is set to “gh-pages”:
![image](https://github.com/user-attachments/assets/1802bc78-4615-4d29-b180-9c84f3fb8d6d)

> 	The message `Your site is live at: XXXX` above is your public GitHub Pages access URL.

#### Step 6. Go to Settings -> Actions and wait for the first deployment to complete:
![image](https://github.com/user-attachments/assets/e57336ef-2f35-4455-abc0-76dce07470ee)

#### Step 7. Access the GitHub Pages URL to ensure the fork was successful:
![image](https://github.com/user-attachments/assets/023c39f7-9351-4175-8c9f-5eb42e2ecdb9)

> Congratulations! Deployment successful. You can now modify the configuration files with your own data. 🎉🎉🎉

### Configuration
Edit The [config.yml](./config.yml) file located in the root directory.

```yaml
# Site Configuration

# Theme, mapped to the directory: ./theme/xxxx
theme: default

# HTML Language setting
lang: "en"

# Plugins, implemented in ./plugins/PLUGIN_NAME
# Use {{ vars.PLUGIN_NAME }} in the settings below

# The output of the plugin can be used below, e.g., {{vars.MediumFollowersCountPlugin}}
plugins:
  # Automatically fetch Medium follower count
  - MediumFollowersCountPlugin:
      username: zhgchgli
  # Automatically fetch Github repo star count
  - GithubRepoStarsCountPlugin:
      - ZhgChgLi/ZMarkupParser
      - ZhgChgLi/ZReviewTender
      - ZhgChgLi/ZMediumToMarkdown
      - ZhgChgLi/linkyee

# Google Analytics tracking id
google_analytics_id:

# Google Analytics tracking id
google_analytics_id:

# HTML Title
title: "ZhgChgLi's Links"

# Avatar image path
avatar: "./images/profile.jpeg"

# Name section text
name: "@zhgchgli"

# Tagline section text
tagline: >-
    An iOS, web, and automation developer from Taiwan 🇹🇼 who also loves sharing, traveling, and writing.

# List of links
# icon: Use Font Awesome icons (https://fontawesome.com/search?o=r&m=free)
# text: The displayed text for the link
# title: The url title
# url: The URL of the link
# alt: Alternative text for accessibility
# target: `_blank` opens in a new tab, `_self` opens in the same frame
links:
  - link:
      icon: "fa-brands fa-medium"
      text: "Tech Blog <span class='link-button-text'>({{vars.MediumFollowersCountPlugin}} Followers)</span>"
      url: "https://blog.zhgchg.li"
      alt: "ZhgChgLi's Tech Blog"
      title: "ZhgChgLi's Tech Blog"
      target: "_blank"
  - link:
      icon: "fa-brands fa-medium"
      text: "Travelog <span class='link-button-text'>({{vars.MediumFollowersCountPlugin}} Followers)</span>"
      url: "https://medium.com/ztravel"
      alt: "ZhgChgLi's Travelog"
      title: "ZhgChgLi's Travelog"
      target: "_blank"
  - link:
      icon: "fa-solid fa-rss"
      text: "Website"
      url: "https://zhgchg.li/"
      alt: "ZhgChgLi's Website"
      title: "ZhgChgLi's Website"
      target: "_blank"
  - link:
      icon: "fa-brands fa-swift"
      text: "ZMarkupParser <span class='link-button-text'>({{vars.GithubRepoStarsCountPlugin['ZhgChgLi/ZMarkupParser']}} Stars)</span>"
      url: "https://github.com/ZhgChgLi/ZMarkupParser"
      alt: "ZMarkupParser is a pure-Swift library that helps you to convert HTML strings to NSAttributedString with customized style and tags."
      title: "ZMarkupParser is a pure-Swift library that helps you to convert HTML strings to NSAttributedString with customized style and tags."
      target: "_blank"
  - link:
      icon: "fa-brands fa-app-store-ios"
      text: "ZReviewTender <span class='link-button-text'>({{vars.GithubRepoStarsCountPlugin['ZhgChgLi/ZReviewTender']}} Stars)</span>"
      url: "https://github.com/ZhgChgLi/ZReviewTender"
      alt: "ZReviewTender is a tool for fetching app reviews from the App Store and Google Play Console and integrating them into your workflow."
      title: "ZReviewTender is a tool for fetching app reviews from the App Store and Google Play Console and integrating them into your workflow."
      target: "_blank"
  - link:
      icon: "fa-brands fa-markdown"
      text: "ZMediumToMarkdown <span class='link-button-text'>({{vars.GithubRepoStarsCountPlugin['ZhgChgLi/ZMediumToMarkdown']}} Stars)</span>"
      url: "https://github.com/ZhgChgLi/ZMediumToMarkdown"
      alt: "ZMediumToMarkdown is a powerful tool that allows you to effortlessly download and convert your Medium posts to Markdown format."
      title: "ZMediumToMarkdown is a powerful tool that allows you to effortlessly download and convert your Medium posts to Markdown format."
      target: "_blank"
  - link:
      icon: "fa-brands fa-github"
      text: "linkyee <span class='link-button-text'>({{vars.GithubRepoStarsCountPlugin['ZhgChgLi/linkyee']}} Stars)</span>"
      url: "https://github.com/ZhgChgLi/linkyee"
      alt: "linkyee is a fully customized, open-source LinkTree alternative deployed directly on GitHub Pages."
      title: "linkyee is a fully customized, open-source LinkTree alternative deployed directly on GitHub Pages."
      target: "_blank"


# List of social media links
# icon: Use Font Awesome icons (https://fontawesome.com/search?o=r&m=free)
# title: The url title
# url: The URL of the social media link
# alt: Alternative text for accessibility
# target: _blank opens in a new tab, _self opens in the same frame
socials:
  - social:
      icon: "fa-brands fa-medium"
      url: "https://blog.zhgchg.li"
      title: "ZhgChgLi's Medium"
      alt: "ZhgChgLi's Medium"
      target: "_blank"
  - social:
      icon: "fa-brands fa-github"
      url: "https://github.com/ZhgChgLi"
      title: "ZhgChgLi's GitHub"
      alt: "ZhgChgLi's GitHub"
      target: "_blank"
  - social:
      icon: "fa-brands fa-twitter"
      url: "https://twitter.com/zhgchgli"
      title: "ZhgChgLi's Twitter"
      alt: "ZhgChgLi's Twitter"
      target: "_blank"
  - social:
      icon: "fa-brands fa-linkedin"
      url: "https://www.linkedin.com/in/zhgchgli/"
      title: "ZhgChgLi's LinkedIn"
      alt: "ZhgChgLi's LinkedIn"
      target: "_blank"
  - social:
      icon: "fa-brands fa-instagram"
      url: "https://www.instagram.com/zhgchgli/"
      title: "Instagram"
      alt: "ZhgChgLi's Instagram"
      target: "_blank"
  - social:
      icon: "fa-solid fa-envelope"
      url: "mailto:zhgchgli@gmail.com"
      title: "Email: zhgchgli@gmail.com"
      alt: "zhgchgli@gmail.com"
      target: "_blank"

# Footer text
footer: >
    Welcome to my website! Follow me on Medium or GitHub, or stay connected on Instagram or LinkedIn.

# Footer copyright message
# Linkyee is a 100% free, open-source project—feel free to modify the copyright message as you like. :)
copyright: >
  © 2024  <a href="https://zhgchg.li" target="_blank">ZhgChgLi</a>. Powered by <a href="https://github.com/ZhgChgLi/linkyee" target="_blank">linkyee</a>
```

#### Please note that after each files modification, you need to wait for GitHub Actions to complete the `Automatic build` and `pages build and deployment` tasks.

![image](https://github.com/user-attachments/assets/0ba637cc-3bb6-4458-a076-5f754c7429b3)

Refresh the page for the changes to take effect. 🚀

### Customized
#### Modify Default Theme

- `./themes/default/index.html`
- `./themes/default/styles.css`
- `./themes/default/scripts.js`

#### Create a New Theme

1. `./themes/YOUR_THEME`
2. Update `theme:YOUR_THEME` in `config.yml` file

> Yes, you can use GenAI tools like ChatGPT to help you create your own custom link pages!

#### Automatic Redeployment

By default, the project redeploys automatically once a day to refresh the values of plugin's dynamic variables. You can adjust the [cron](https://crontab.guru/#0_0_*_*_*) settings in [build.yml](../../actions/workflows/build.yml):
```
schedule:
    - cron: '0 0 * * *'  # Runs daily at midnight (00:00 UTC)
```
If you don’t need scheduled redeployment, simply delete the schedule block.

## Custom Domain ❤️❤️❤️

You can set a custom GitHub Pages domain, such as my own: [https://link.zhgchg.li](https://link.zhgchg.li).

Follow [my tutorial for domain binding.](https://en.zhgchg.li/posts/483af5d93297/) If you’d like, you can [purchase a domain through my Namecheap referral](https://namecheap.pxf.io/P0jdZQ) link—I’ll earn a small commission, which will help me continue contributing to open-source projects.

---

## About
- [ZhgChg.Li](https://zhgchg.li/)
- [ZhgChgLi's Medium](https://blog.zhgchg.li/)

## Other works
### Swift Libraries
- [ZMarkupParser](https://github.com/ZhgChgLi/ZMarkupParser) is a pure-Swift library that helps you to convert HTML strings to NSAttributedString with customized style and tags.
- [ZPlayerCacher](https://github.com/ZhgChgLi/ZPlayerCacher) is a lightweight implementation of the AVAssetResourceLoaderDelegate protocol that enables AVPlayerItem to support caching streaming files.
- [ZNSTextAttachment](https://github.com/ZhgChgLi/ZNSTextAttachment) enables NSTextAttachment to download images from remote URLs, support both UITextView and UILabel.

### Integration Tools
- [ZReviewTender](https://github.com/ZhgChgLi/ZReviewTender) is a tool for fetching app reviews from the App Store and Google Play Console and integrating them into your workflow.
- [ZMediumToMarkdown](https://github.com/ZhgChgLi/ZMediumToMarkdown) is a powerful tool that allows you to effortlessly download and convert your Medium posts to Markdown format.

