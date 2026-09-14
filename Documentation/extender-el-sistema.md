---
title: Como extender el sistema
uid: extender-el-sistema
---

# Como extender el sistema

## Crear una nueva habilidad

1. Hereda de `BaseSkill`.
2. Sobrescribe `Awake` solo si necesitas configurar el collider o preparar datos propios.
3. Crea un prefab con el componente de habilidad.
4. Asigna un `SO_SkillData`.
5. Añade el tipo correspondiente a `Enum_AtkList`.
6. Registra el prefab en la lista de habilidades de `EnemyCombatFacade`.
7. Añade el ataque a la lista de `EnemyCombat`.

## Crear una variante de enemigo

Hereda únicamente el modulo que necesite un comportamiento distinto. Por ejemplo:

- `EnemyMovement` para cambiar como navega.
- `EnemyHealth` para modificar dano recibido o curacion.
- `EnemyAnim` para ampliar estados de animacion.
- `BaseSkill` para cambiar el comportamiento de un ataque.

Evita duplicar `EnemyBrain` si la diferencia puede expresarse mediante datos o un componente especializado.

## Lista de comprobacion

- El prefab de habilidad no es nulo.
- El `AttackType` del registro coincide con el tipo del ataque.
- El `BaseCollider` tiene filtros adecuados.
- El prefab contiene un `SO_SkillData` asignado.
- La animacion usa nombres que coinciden con `Enum_EnemyAnim`.
- El enemigo tiene un `NavMeshAgent` valido.
- El objetivo usa el tag `Player` cuando el agro depende de ese tag.
