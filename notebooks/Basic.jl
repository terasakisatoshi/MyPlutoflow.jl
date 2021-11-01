### A Pluto.jl notebook ###
# v0.17.0

using Markdown
using InteractiveUtils

# ╔═╡ 59c831e4-3b12-11ec-2a74-abb04b716820


# ╔═╡ fae3fa10-3b10-11ec-22ad-8d721eef9e1f


# ╔═╡ a38cfb68-3b10-11ec-0f31-27172c3a67c7


# ╔═╡ 3049a854-3b10-11ec-17c3-2bd1d28fb0d7


# ╔═╡ b2dfa629-93d4-44d5-9584-32de8ec3d1c4
md"""This notebook is taken from [Pluto.jl/sample/Basic.jl](https://github.com/fonsp/Pluto.jl/blob/main/sample/Basic.jl)
"""

# ╔═╡ b2d786ec-7f73-11ea-1a0c-f38d7b6bbc1e
md"""
# The Basel problem

_Leonard Euler_ proved in 1741 that the series

```math
\frac{1}{1} + \frac{1}{4} + \frac{1}{9} + \cdots
```

converges to

```math
\frac{\pi^2}{6}.
```
"""

# ╔═╡ b2d79330-7f73-11ea-0d1c-a9aad1efaae1
n = 1:100000

# ╔═╡ b2d79376-7f73-11ea-2dce-cb9c449eece6
seq = n .^ -2

# ╔═╡ b2d792c2-7f73-11ea-0c65-a5042701e9f3
sqrt(sum(seq) * 6.0)

# ╔═╡ Cell order:
# ╟─59c831e4-3b12-11ec-2a74-abb04b716820
# ╟─fae3fa10-3b10-11ec-22ad-8d721eef9e1f
# ╟─a38cfb68-3b10-11ec-0f31-27172c3a67c7
# ╟─3049a854-3b10-11ec-17c3-2bd1d28fb0d7
# ╟─b2dfa629-93d4-44d5-9584-32de8ec3d1c4
# ╟─b2d786ec-7f73-11ea-1a0c-f38d7b6bbc1e
# ╠═b2d792c2-7f73-11ea-0c65-a5042701e9f3
# ╠═b2d79330-7f73-11ea-0d1c-a9aad1efaae1
# ╠═b2d79376-7f73-11ea-2dce-cb9c449eece6
