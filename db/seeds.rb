# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Strength.create([{ name: 'achiever', domain: 'executing' }, { name: 'arranger', domain: 'executing' },
                 { name: 'belief', domain: 'executing' }, { name: 'consistency', domain: 'executing' },
                 { name: 'deliberative', domain: 'executing' }, { name: 'discipline', domain: 'executing' },
                 { name: 'focus', domain: 'executing' }, { name: 'responsibility', domain: 'executing' },
                 { name: 'restorative', domain: 'executing' }, { name: 'activator', domain: 'influencing' },
                 { name: 'command', domain: 'influencing' }, { name: 'communication', domain: 'influencing' },
                 { name: 'competition', domain: 'influencing' }, { name: 'maximizer', domain: 'influencing' },
                 { name: 'self-assurance', domain: 'influencing' }, { name: 'significance', domain: 'influencing' },
                 { name: 'woo', domain: 'influencing' }, { name: 'adaptability', domain: 'relationship building' },
                 { name: 'connectedness', domain: 'relationship building' }, { name: 'developer', domain: 'relationship building' },
                 { name: 'empathy', domain: 'relationship building' }, { name: 'harmony', domain: 'relationship building' },
                 { name: 'includer', domain: 'relationship building' }, { name: 'individualization', domain: 'relationship building' },
                 { name: 'positivity', domain: 'relationship building' }, { name: 'relator', domain: 'relationship building' },
                 { name: 'analytical', domain: 'strategic thinking' }, { name: 'context', domain: 'strategic thinking' },
                 { name: 'futuristic', domain: 'strategic thinking' }, { name: 'ideation', domain: 'strategic thinking' },
                 { name: 'input', domain: 'strategic thinking' }, { name: 'intellection', domain: 'strategic thinking' },
                 { name: 'learner', domain: 'strategic thinking' }, { name: 'strategic', domain: 'strategic thinking' }])