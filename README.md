# 物理学基本定律与逻辑关系
### Fundamental Physics Laws and Their Logical Relations

**中英双语 · LaTeX 编纂 · 13 轮迭代精炼 · 完整性&自洽性证明**

一本从 6 条核心原则推导出 **43 条推导链**的书。
每条规则包含完整变量定义表（符号、类型、量纲、定义域、物理含义）、
成立条件与失效边界、必要性论证、充分性论证。
每条定理包含严格分步推导——每步标注必要性 [N] 和充分性 [S]，
变量全部可追溯至 R1-R6。**元验证**：完整性 100%，自洽性 0 矛盾，所有 kernel 必要。

## 结构

```
Part I: 基本公理（R1–R6）+ 论证语言单位
  Ch 1  — R1 因果时空结构
  Ch 2  — R2 最小作用量原理
  Ch 3  — R3 局域规范不变性
  Ch 4  — R4 量子力学公设
  Ch 5  — R5 Born 概率规则
  Ch 6  — R6 熵的统计定义

Part II: 有效定律与推论（43 条 — 严格推导）
  Ch 7  — 力学（Euler-Lagrange, Noether, Newton 三定律, Kepler）
  Ch 8  — 电磁学（Maxwell 四方程, Lorentz 力, 电磁波）
  Ch 9  — 量子力学（Schrödinger, E=hν, de Broglie, 不确定性, Pauli 13步）
  Ch 10 — 热力学（第零/一/三定律, 理想气体, FD/BE, Nernst 不可达性）
  Ch 11 — 相对论（Lorentz 变换, E=mc², Einstein 场方程 + Lovelock 10步）
  Ch 12 — 守恒律（Noether 四大守恒）
  Ch 13 — 维度结构推论（7条: 平方反比/SO(3)/Kepler/Huygens/Minkowski/GW/体积）★新
  Ch 14 — 标准模型 EFT（渐近自由/Higgs 机制/CKM 矩阵）★新
  Ch 15 — 全局证明（语言单位/完整性100%/必要性矩阵/自洽性/交叉印证网）★新

附录   — 物理常数表, 43条推导依赖表, 依赖关系总图
```

## 核心方法论：充分且必要

- **充分性 `[S]`**：给定标注的前提条件，结论必然成立
- **必要性 `[N]`**：移除标注的条件，推导在对应步骤断裂
- **反向蕴含**：每条推导标注 `reversible: true/false`

## 编译

```bash
# Docker (推荐)
docker run --rm -v $(pwd):/work -w /work/book \
  ghcr.io/xu-cheng/texlive-full:latest \
  bash -c "xelatex main.tex && xelatex main.tex"
# PDF: book/physics-foundations.pdf
```

## 与 physics-foundations 的关系

本书内容来源于 [physics-foundations](https://github.com/hjiang555-a11y/physics-foundations) 仓库（Round 13）：
- `rules.md`：R1-R6 精炼版（778 行，含充分必要性审计）
- `layer1/rigorous_derivations.yaml`：43 条严格推导（~2700 行）
- `layer1/PROOF.md`：完整性·自洽性·充分必要性形式化证明
- `tools/meta_validate.py`：元验证工具

## 许可

CC BY-SA 4.0
