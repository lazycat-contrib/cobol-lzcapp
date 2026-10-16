# COBOL 实战课程 for LazyCat

上游：https://github.com/iamcheyan/cobol

包名：community.lazycat.app.cobol（前缀来源 default）

静态站点模式，使用 git 版本源。目标 linux/amd64；仅发布喵喵商店。

## 使用

直接访问应用即可查看 COBOL 课程内容。

## 发布配置

- 版本源：git tags (SemVer)
- 更新策略：publish
- 目标商店：私有/社区喵喵商店
- public_path: /
- 文件拦截：未启用（喵喵商店默认）

GitHub Actions 通过组织 APPSTORE_URL、APPSTORE_TOKEN 和可选 PRIVATE_STORE_GROUP_CODES Secrets 发布版本化 Release LPK。
