# GitHub Trending 爬取结果

## 📊 今日热门 (Daily)

| 仓库 | 语言 | 今日 Star | 总 Star |
|------|------|-----------|---------|
| [TauricResearch/TradingAgents](https://github.com/TauricResearch/TradingAgents) | Python | +2,225 ⭐ | 63,882 |
| [ruvnet/ruflo](https://github.com/ruvnet/ruflo) | TypeScript | +1,299 ⭐ | 37,349 |
| [soxoj/maigret](https://github.com/soxoj/maigret) | Python | +1,064 ⭐ | 23,148 |
| [jwasham/coding-interview-university](https://github.com/jwasham/coding-interview-university) | - | +694 ⭐ | 344,767 |
| [1jehuang/jcode](https://github.com/1jehuang/jcode) | Rust | +482 ⭐ | 3,081 |
| [browserbase/skills](https://github.com/browserbase/skills) | JavaScript | +346 ⭐ | 1,630 |
| [Flowseal/zapret-discord-youtube](https://github.com/Flowseal/zapret-discord-youtube) | Batchfile | +181 ⭐ | 27,166 |
| [ShareX/ShareX](https://github.com/ShareX/ShareX) | C# | +152 ⭐ | 36,996 |

---

## 📈 本周热门 (Weekly)

| 仓库 | 语言 | 本周 Star | 总 Star |
|------|------|-----------|---------|
| [forrestchang/andrej-karpathy-skills](https://github.com/forrestchang/andrej-karpathy-skills) | - | +20,079 ⭐ | 107,402 |
| [mattpocock/skills](https://github.com/mattpocock/skills) | Shell | +35,324 ⭐ | 55,840 |
| [TauricResearch/TradingAgents](https://github.com/TauricResearch/TradingAgents) | Python | +8,489 ⭐ | 63,886 |
| [Z4nzu/hackingtool](https://github.com/Z4nzu/hackingtool) | Python | +7,210 ⭐ | 70,604 |
| [abhigyanpatwari/GitNexus](https://github.com/abhigyanpatwari/GitNexus) | TypeScript | +5,465 ⭐ | 34,954 |
| [soxoj/maigret](https://github.com/soxoj/maigret) | Python | +2,678 ⭐ | 23,150 |
| [AIDC-AI/Pixelle-Video](https://github.com/AIDC-AI/Pixelle-Video) | Python | +2,315 ⭐ | 9,354 |
| [CJackHwang/ds2api](https://github.com/CJackHwang/ds2api) | Go | +1,832 ⭐ | 3,207 |
| [Alishahryar1/free-claude-code](https://github.com/Alishahryar1/free-claude-code) | Python | +9,364 ⭐ | 20,416 |

---

## 🏆 本月热门 (Monthly)

| 仓库 | 语言 | 本月 Star | 总 Star |
|------|------|-----------|---------|
| [NousResearch/hermes-agent](https://github.com/NousResearch/hermes-agent) | Python | +107,704 ⭐ | 130,344 |
| [forrestchang/andrej-karpathy-skills](https://github.com/forrestchang/andrej-karpathy-skills) | - | +98,469 ⭐ | 107,402 |
| [microsoft/markitdown](https://github.com/microsoft/markitdown) | Python | +26,800 ⭐ | 119,688 |
| [thedotmack/claude-mem](https://github.com/thedotmack/claude-mem) | TypeScript | +26,887 ⭐ | 71,252 |
| [rtk-ai/rtk](https://github.com/rtk-ai/rtk) | Rust | +23,381 ⭐ | 40,278 |
| [multica-ai/multica](https://github.com/multica-ai/multica) | TypeScript | +22,270 ⭐ | 23,914 |
| [mattpocock/skills](https://github.com/mattpocock/skills) | Shell | +42,738 ⭐ | 55,840 |
| [Alishahryar1/free-claude-code](https://github.com/Alishahryar1/free-claude-code) | Python | +18,673 ⭐ | 20,416 |
| [Fincept-Corporation/FinceptTerminal](https://github.com/Fincept-Corporation/FinceptTerminal) | Python | +16,170 ⭐ | 19,329 |
| [Z4nzu/hackingtool](https://github.com/Z4nzu/hackingtool) | Python | +12,929 ⭐ | 70,604 |

---

## 💡 爬取方法总结

**最简单的方法：使用 Claude Code 的 WebFetch 工具**

```python
# 直接获取数据
WebFetch(
    url="https://github.com/trending?since=daily",
    prompt="提取所有 trending 仓库信息，返回 JSON 格式"
)
```

**其他方法：**
1. **requests + BeautifulSoup** - 需要处理 GitHub 的动态内容
2. **Playwright/Selenium** - 可处理 JavaScript 渲染，但较重
3. **第三方 API** - 如 gitstar-ranking.com 等

**注意：** GitHub 现在对未登录用户限制了 trending 页面的完整访问，推荐使用带认证的方式或 WebFetch。
