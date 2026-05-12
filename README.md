# 物理学基本定律与逻辑关系
### Fundamental Physics Laws and Their Logical Relations

**中英双语 · LaTeX 编纂 · 9 轮迭代精炼**

一本从 6 条核心原则推导出 30 条有效定律与推论的书。
每条规则包含完整变量定义表（符号、类型、量纲、定义域、物理含义）、
成立条件与失效边界、必要性论证、充分性论证。
每条定理包含严格分步推导——每步标注必要条件 `[N]` 和充分条件 `[S]`，
变量全部可追溯至 R1–R6。

## 结构

```
Part I: 基本公理（R1–R6）
  Ch 1  — R1 因果时空结构（最大传播速度 ⇔ Lorentz 因果结构）
  Ch 2  — R2 最小作用量原理
  Ch 3  — R3 局域规范不变性
  Ch 4  — R4 量子力学公设（R4+R5 = 最小统计诠释）
  Ch 5  — R5 Born 概率规则
  Ch 6  — R6 熵的统计定义

Part II: 有效定律与推论（30 条 — 严格推导）
  Ch 7  — 力学（Euler-Lagrange, Noether, Newton 三定律, Kepler）
  Ch 8  — 电磁学（Maxwell 四方程, Lorentz 力, 电磁波）
  Ch 9  — 量子力学（Schrödinger, Planck-Einstein, de Broglie, 不确定性）
  Ch 10 — 热力学（第零/一/三定律, 理想气体, Fermi-Dirac, Bose-Einstein）
  Ch 11 — 相对论（Lorentz 变换, 质能等价, Einstein 场方程, Newton 引力）
  Ch 12 — 守恒律（Noether → 能量/动量/角动量/电荷守恒）

附录   — 物理常数表, 推导依赖关系总图, 参考文献
```

## 核心方法论：充分且必要

- **充分性 `[S]`**：给定标注的前提条件，结论必然成立
- **必要性 `[N]`**：移除标注的条件，推导在对应步骤断裂
- **反向蕴含**：每条推导标注 `reversible: true/false`——结论是否能反推前提

## 编译

```bash
# 需要 Tectonic (XeTeX)
make
# PDF: book/physics-foundations.pdf
```

## 与 physics-foundations 的关系

本书内容来源于 [physics-foundations](https://github.com/hjiang555-a11y/physics-foundations) 仓库，
经过 9 轮迭代精炼：
- `rules.md`：人读 R1–R6 精炼版（702 行，46 节）
- `layer1/rigorous_derivations.yaml`：30 条定理的机验严格推导（1903 行）
- `layer1/LANGUAGE.md`：语言描述方法（529 行，含迭代协议和检查清单）

## 许可

CC BY-SA 4.0
