# Round 18 设计文档：科普补齐 + 反事实物理章 + 可视化全面强化

**日期**：2026-06-04
**作者**：Claude Code (Sisyphus 工作流)
**状态**：待用户审阅
**仓库**：physics-foundations-book + physics-foundations

---

## 1. 目标与背景

### 1.1 起点

- **physics-foundations** Round 13：150 nodes / 43 derivations，V1-V5 全过，meta_validate 100% 完整性
- **physics-foundations-book** Round 17：156 页 PDF，15 章 + 附录；Ch01/04/05/08-14 已含"科普层"叙事，Ch02/03/06/07/15 仍纯技术
- ROADMAP 长期项 L1（反事实物理附录）未启动

### 1.2 Round 18 目标

按方法 A（完全顺序，单 Round 多 commit，最终一次发版 PDF）一次性推进三件事：

1. **科普层补齐**：Ch02/03/06/07/15 各加科普叙事 + 核心图像，使全书科普层覆盖一致
2. **反事实物理章 Ch16**：~40 页新章，作为 Part II 第 10 章（不入附录），覆盖 13 个 R1-R6 反事实子场景
3. **可视化全面强化**：附录 3 张总图 + 16 张章首定位图 + Ch16 内嵌 8 张对比图 + Ch15 内 2 张证明图

最终 PDF：156 页 → 230-260 页。

---

## 2. 实施方法：A 完全顺序

三段顺序、单 Round 标识、各段独立 commit、最终一次发版 PDF：

| Stage | 工作 | commit 时机 |
|---|---|---|
| 1 | Ch02/03/06/07/15 科普层 .tex 编辑 | xelatex 验证通过即 commit |
| 2 | Ch16 新章 + counterfactuals.yaml | xelatex 验证通过即 commit |
| 3 | 所有 TikZ 增强 + 最终 main.pdf | xelatex × 2 通过后 commit + 发版 |

理由：图依赖文本（章首定位图需知反事实章在 toc 的位置），先文本可让图准确定位；分阶段 commit 限制每次 diff 体量便于追因。

---

## 3. Stage 1：科普层补齐（Ch02/03/06/07/15）

### 3.1 模板

每章在第 1 节 `\section{总说}` 后新增两个子节：

```latex
\subsection{科普层：<主题切入点标题>}
... ~30-50 行叙事 ...

\subsection{核心图像：<视觉/概念图像标题>}
... ~20-30 行 + 计算示例 ...
```

每章 .tex 增量约 50-80 行，与 Round 17 已有章节量级一致。

### 3.2 各章主题适配

| 章 | 主题 | 科普叙事切入点 | 核心图像 |
|---|---|---|---|
| **Ch02** R2 最小作用量 | 自然为何"懒惰" | Fermat 折射 → Maupertuis 1744 神学动机 → Lagrange 数学化 → Feynman 路径积分（"所有路径"重新解释 [N]） | 抛物线轨迹的 $S=\int L\,dt$ 几何示意；驻点 vs 极小点的区别 |
| **Ch03** R3 规范不变性 | 物理无视坐标的选择 | 电势的"零点"任意性（接地） → Weyl 1918 失败的引力规范 → Yang-Mills 1954 → 现代规范理论 | $A_\mu \to A_\mu+\partial_\mu\Lambda$ 的纤维丛"自由度旋转"图像 |
| **Ch06** R6 熵 | 为什么时间有方向 | 一杯热咖啡冷却的分子层叙事 → Boltzmann $S=k\ln W$ 的统计赌博含义 → Maxwell 妖与 Landauer 极限 → 熵 = 无知 | $W$ 对数标度直觉：6 颗骰子 vs 60 颗骰子的微观态数指数爆炸 |
| **Ch07** 力学 | 三百年后 $F=ma$ 仍未被推翻 | 苹果落地的伪历史 → Newton 用 $1/r^2$ 解释 Kepler → Lagrange 形式胜出原因 → 现代为何用 $L=T-V$ 教学 | 单摆双视角：Newton 力图 vs Lagrange 广义坐标，同一答案不同语言 |
| **Ch15** 全局证明 | 为什么我们能"证明物理学" | Hilbert 第六问题百年回顾 → Russell-Whitehead 公理化 → Bourbaki 公理化对物理的启发 → 本书 R1-R6 → 43 定律的形式化意义 | 公理 → 定理金字塔：6 块基石 → 43 块石板 |

### 3.3 计算示例

- **Ch02**：抛物体 $y = v_0 t - g t^2 / 2$ 求 $S = \int (T - V)\,dt$ 极值数值算例
- **Ch03**：单粒子 EM 拉氏量在 $A_\mu \to A_\mu + \partial_\mu\Lambda$ 下 $S$ 不变的逐项验算
- **Ch06**：双骰子 → 双 6 概率 1/36 → $S = k \ln 36$ 量级估算
- **Ch07**：单摆小角近似的 Lagrange 推导对照 Newton 推导

### 3.4 风格约束

- 严格沿用 Round 17 的 `\subsection{科普层：...}` / `\subsection{核心图像：...}` 命名
- Ch15 元层章节：因主题是公理化方法本身，"日常例子"换成"数学史 + 公理化思想史"，不强行套日常例子模板

### 3.5 验收

- [ ] 5 章各加 2 个子节
- [ ] 每章 .tex 增量 50-80 行
- [ ] xelatex × 2 通过，0 errors
- [ ] 中间页数检查：156 → ~175

---

## 4. Stage 2：反事实物理章 Ch16（~40 页）

### 4.1 章节定位

- **章名**：`\chapter{反事实物理学：若 R1-R6 不成立}` (label `ch:counterfactual`)
- **位置**：Part II 第 10 章（Part II 由 9 章变为 10 章），紧接 Ch15 全局证明之后
- **不放附录**：作为正式推导章节而非附录，体现"反事实是 R1-R6 必要性的最强佐证"

### 4.2 节结构

```
§16.1 引言：必要性的最强佐证            (~2 页)
  - 形式化"若 X 不成立，则定律 Y 退化为 Z"的论证语言
  - 引用 Ch15 必要性矩阵作为索引

§16.2 R1 因果时空结构的反事实           (~12 页)
  16.2.1 [R1a] 若因果结构非 Lorentzian — Galilean 极限 c→∞
  16.2.2 [R1b] 若 D≠3 空间维度 — 平方反比律的崩坏
  16.2.3 [R1c] 若等效原理失效 — 引力作为"力"

§16.3 R2-R3 作用量与规范不变性的反事实   (~8 页)
  16.3.1 若 δS = 0 不成立（高阶导数 L）— Ostrogradsky 不稳定性
  16.3.2 若 U(1) 规范不变性破缺 — 光子获得质量
  16.3.3 若 SU(3) 渐近自由不成立 — 夸克可分离

§16.4 R4-R5 量子力学公设的反事实         (~10 页)
  16.4.1 若 [x̂,p̂]=0 — 经典极限（ℏ→0 重述）
  16.4.2 若 Hilbert 空间为实数 — Stueckelberg 1960 否定论证
  16.4.3 若 Born 规则非平方而是其他幂次 — Gleason 唯一性

§16.5 R6 熵的反事实                      (~6 页)
  16.5.1 若 S = k·lnW 改为线性 — 第二定律退化
  16.5.2 若等概率先验失效 — 经典统计力学根基崩塌

§16.6 综合：CPT 定理与现代变异           (~3 页)
  - CPT 破缺的物理后果与实验上限
  - 庞加莱 vs Galilean vs Carroll 群比较

§16.7 结语：必要性的边界                  (~1 页)
```

合计 13 个反事实子场景 + 综合 = 14 个物理推演单元，约 40 页。

### 4.3 论证语言（每子场景统一格式）

```latex
\subsubsection{反事实假设 [A]}
... 具体修改 ...

\subsubsection{受影响的推导链}
- 直接断裂: deriv.X.Y, deriv.X.Z   (引用 layer1 节点 ID)
- 间接退化: cor.A, contingent.B

\subsubsection{形式推导：从 [A] 到退化定律 Z}
... 5-10 步形式推导 ...

\subsubsection{实验约束 / 反事实的现实上限}
... 已知精度（c 各向异性 < 10⁻¹⁷, CPT < 10⁻¹⁸ 等）...

\subsubsection{文献}
... ≥3 篇 peer-reviewed ...
```

### 4.4 与已有章节的耦合

- 每个反事实场景必须引用 Ch15.PROOF.md 必要性矩阵中对应的 [N] 标注
- Ch15 末加 `\seealso{Ch16}` 钩子
- 形成"必要性条件 [N] ↔ 反事实推演"双向印证网

### 4.5 新增源数据

`physics-foundations/layer1/counterfactuals.yaml`：

```yaml
counterfactuals:
  - id: cf.lorentz_to_galilean
    perturbation: "c → ∞"
    breaks:
      - law.lorentz_transformation
      - law.mass_energy_equivalence
    degrades_to:
      - "Galilean transformation"
      - "non-relativistic E = ½mv²"
    references:
      - Ehrenfest 1917
      - Tangherlini 1963
    experimental_bound: "Lorentz isotropy < 10⁻¹⁷"
  ...
```

须通过 `validate_derivations.py` V1-V5 验证（视为新数据节点类型，需扩展验证器或独立验证）。

### 4.6 验收

- [ ] `book/chapters/ch16-counterfactual.tex` 创建，~1500-2000 行
- [ ] 14 个推演单元，每单元 5 段固定结构
- [ ] `physics-foundations/layer1/counterfactuals.yaml` 创建并通过验证
- [ ] main.tex 第 472 行后 `\include{chapters/ch16-counterfactual}`
- [ ] Ch15 末加交叉引用钩子
- [ ] 中间页数检查：175 → ~215

---

## 5. Stage 3：可视化全面强化

### 5.1 附录三张总图

| 图 | 位置 | TikZ 内容 | 行数估计 |
|---|---|---|---|
| **G1: 推导依赖 DAG** | 附录"推导依赖关系总图" | 63 节点 / 119 边，按层着色（kernel 红方框 / law 蓝椭圆 / cor 绿椭圆 / contingent 灰六边形），分组 G1-G11 | ~250 行 |
| **G2: R1-R6 影响热图** | 附录新增节"R1-R6 影响矩阵" | 6 行 × 43 列方格矩阵，深色=直接断裂 / 浅色=间接退化 / 空白=无关 | ~150 行 |
| **G3: Part II 章间印证网** | 附录新增节"交叉印证网" | 9 章圆环 + 加粗弧线表互证关系（Ch9 Pauli ↔ Ch10 Nernst ↔ Ch16 反事实等） | ~120 行 |

### 5.2 每章首定位图（16 张）

每章在 `\chapter{...}` 后、`\section{总说}` 前插入：

```latex
\begin{center}
\begin{tikzpicture}[scale=0.6]
  \input{figures/locator-chXX.tikz}
\end{tikzpicture}
\caption*{本章在依赖图中的位置（高亮：本章相关节点）}
\end{center}
```

- 每张定位图 = G1 总图的子集，本章涉及节点高亮（粗边/红色），其余灰化
- 16 张共享同一坐标系（建立读者心智地图，不视为冗余）
- 文件：`book/figures/locator-ch01.tikz` 至 `locator-ch16.tikz`

### 5.3 Ch16 内嵌反事实对比图（8 张）

| 图 | 位置 | 内容 |
|---|---|---|
| F16.1 | §16.2.1 | Lorentz 光锥 vs Galilean 同时面 |
| F16.2 | §16.2.2 | $1/r^{D-1}$ 势能曲线对比（D=2,3,4,5） |
| F16.3 | §16.2.2 | D=3 稳定圆轨道 vs D≥4 螺旋发散轨道 |
| F16.4 | §16.3.2 | Coulomb $1/r$ vs Yukawa $e^{-mr}/r$ 势 |
| F16.5 | §16.4.1 | $\hbar\to 0$ 经典极限 vs $\hbar>0$ 量子能级 |
| F16.6 | §16.4.3 | Born $p^2$ vs $p^3$ 概率范数对比 |
| F16.7 | §16.5.1 | $S=k\ln W$ vs $S=kW$ 微观态-熵曲线 |
| F16.8 | §16.6 | Poincaré / Galilean / Carroll 群结构对比 |

### 5.4 Ch15 全局证明可视化升级

- **F15.1**: 必要性矩阵紧凑版（6×30 浓缩，作为 G2 章内预览）
- **F15.2**: 自洽性图（DAG 无环可视化证明，标注最长链 Ch7→Ch11→Ch16）

### 5.5 自动化工具

新增 `physics-foundations/tools/generate_tikz.py`：

- 读取 `layer1/derivations.yaml` + `effective_laws.yaml` + `counterfactuals.yaml`
- 调用 graphviz dot/neato 自动布局
- 输出 `book/figures/dag-full.tikz`、`affect-matrix.tikz`、`cross-validation.tikz`、16 张 `locator-chXX.tikz`
- F16.x 的 8 张对比图为物理曲线图，仍手写

工具同 commit 到 physics-foundations 仓。

### 5.6 编译策略

- 启用 `\usetikzlibrary{external}` 缓存（首次 5-10 分钟，后续仅重画改动图）
- 单图独立测试：`figures/_test.tex` 单独 `\input` 各 .tikz 验证编译
- main.tex 跑 `xelatex × 2`，目标 0 errors
- `.gitignore` 添加 `book/*-figure*` 防 TikZ 缓存入库

### 5.7 总图数

- Round 17：~10 张 TikZ
- Round 18：10 + 3（总图）+ 16（定位）+ 8（F16）+ 2（F15）= **39 张**

### 5.8 验收

- [ ] `tools/generate_tikz.py` 创建并能运行
- [ ] 3 张总图 .tikz 编译通过
- [ ] 16 张定位图 .tikz 编译通过
- [ ] 8 张 F16 对比图 + 2 张 F15 证明图编译通过
- [ ] 各章首插入定位图代码块
- [ ] xelatex × 2 通过，0 errors
- [ ] 最终 PDF 230-260 页

---

## 6. 全局验收

- [ ] physics-foundations 仓 V1-V5 验证全过（含 counterfactuals.yaml）
- [ ] `tools/meta_validate.py` 完整性 100% 不退化
- [ ] 双仓 commit 信息含 "Ultraworked with Sisyphus" + Co-authored-by
- [ ] README/ROADMAP 同步：ROADMAP 标 L1 ✅；book README 加 Ch16
- [ ] 最终 commit：`feat: Round 18 — counterfactual physics + popular science completion + visualization overhaul`

---

## 7. 风险与缓解

| 风险 | 缓解 |
|---|---|
| 250 行手写 TikZ 出错难调 | `tools/generate_tikz.py` 自动生成 + 单图独立测试 .tex |
| Ch16 实验上限数据老旧 | 引用 PDG 2024、CODATA 2022 最新精度 |
| 16 张定位图视觉冗余 | 共享坐标系建立心智地图；每张高亮节点不同 |
| TikZ external 缓存与 git 冲突 | `.gitignore` 加 `book/*-figure*` |
| 反事实章学术严谨性 | 每节文献节 ≥3 篇 peer-reviewed，与 [N] 双向链接 |
| Round 18 一次发版 diff 大 | 内部 3 commit 拆分；Round 标识统一 |
| counterfactuals.yaml 验证器不支持新节点类型 | 视情况扩展 validate_derivations.py，或对 yaml 单独写校验脚本 |

---

## 8. 非目标 / YAGNI

- 不实现 ROADMAP L2 (.scihf parser)
- 不实现 ROADMAP L3 (实验数据库 yaml 独立结构) — 仅在 Ch16 文献节内嵌引用
- 不重写已有章节 — 仅做加法（Ch15 末加交叉引用钩子例外）
- 不切换文档语言 / 不重排已有章节顺序

---

## 9. 文件改动清单

### physics-foundations-book

```
book/main.tex                              [edit] 第 472 行后插入 \include{chapters/ch16-counterfactual}
book/chapters/ch02-r2-action.tex          [edit] +科普层 +核心图像 +定位图
book/chapters/ch03-r3-gauge.tex           [edit] 同上
book/chapters/ch06-r6-entropy.tex         [edit] 同上
book/chapters/ch07-mechanics.tex          [edit] 同上
book/chapters/ch15-proof.tex              [edit] +科普层 +核心图像 +定位图 +F15.1 +F15.2 +seealso Ch16
book/chapters/ch01-r1-spacetime.tex       [edit] +定位图（仅插入）
... ch04/05/08/09/10/11/12/13/14 ...      [edit] +定位图（仅插入）
book/chapters/ch16-counterfactual.tex     [new]  ~1500-2000 行
book/figures/dag-full.tikz                [new]
book/figures/affect-matrix.tikz           [new]
book/figures/cross-validation.tikz        [new]
book/figures/locator-ch01.tikz ~ ch16.tikz [new] 16 张
book/figures/f16-1.tikz ~ f16-8.tikz      [new] 8 张
book/figures/f15-1.tikz ~ f15-2.tikz      [new] 2 张
book/figures/_test.tex                    [new] 单图测试入口
.gitignore                                [edit] + book/*-figure*
README.md                                 [edit] + Ch16 章节
docs/superpowers/specs/2026-06-04-...md   [new] 本文件
```

### physics-foundations

```
layer1/counterfactuals.yaml               [new] 14 个反事实条目
tools/generate_tikz.py                    [new] 自动 TikZ 生成器
tools/validate_derivations.py             [edit] 扩展支持 counterfactuals 类型（如必要）
ROADMAP.md                                [edit] 标记 L1 完成
README.md                                 [edit] 数据规模更新
```

---

## 10. 估算工作量

| Stage | LOC（含新文件）| 编译次数 | 风险点 |
|---|---|---|---|
| 1 | ~400 行 .tex 编辑 | 1 | 主题适配 Ch15 |
| 2 | ~1800 行新 .tex + 200 行 yaml | 1 | 实验上限数据搜集 |
| 3 | ~1500 行 TikZ + 300 行 Python | 多次（external 缓存预热） | 自动布局质量 |

合计：~4200 行新增 / 修改，39 张图。

---

## 11. 后续工作（不在本 Round）

- ROADMAP L2 (.scihf parser)
- ROADMAP L3 (experiments.yaml 独立结构)
- Round 19+ 应基于本 Round 的反事实层做"教学版"：减少形式推导，增加图示与练习题（对应原选项 3）
