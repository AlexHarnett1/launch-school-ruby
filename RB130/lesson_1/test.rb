p [2, 3, 5].inject(1, &:+)

p [2, 3, 5].inject(1) { |total, num| num + num }

p [2, 3, 5].inject { |total, num| total + num }

p [2, 3, 5].inject { |total, num| num + num }

p [2, 3, 5].inject(1) { |total, num| total + num }