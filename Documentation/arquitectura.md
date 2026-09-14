---
title: Arquitectura
uid: arquitectura
---

# Arquitectura

El sistema se organiza alrededor de una composicion de componentes. `EnemyBrain` coordina el comportamiento, pero delega cada responsabilidad especializada a un modulo.

## Capas

```mermaid
flowchart TB
    subgraph Decision[Decision]
        Brain[EnemyBrain]
    end
    subgraph Variants[Componentes del enemigo]
        Combat[EnemyCombat]
        Health[EnemyHealth]
        Movement[EnemyMovement]
        Data[EnemyData]
        Anim[EnemyAnim]
    end
    subgraph Modules[Modulos reutilizables]
        BaseCombat[EnemyCombatFacade]
        BaseHealth[BaseHealth]
        BaseMovement[BaseMovement]
        BaseAnim[BaseAnim]
        Collider[BaseCollider]
    end
    subgraph Contracts[Contratos]
        Interfaces[IHealth / IMovement / ICollider / IData]
    end
    Brain --> Combat
    Brain --> Health
    Brain --> Movement
    Brain --> Data
    Brain --> Anim
    Combat --> BaseCombat
    Health --> BaseHealth
    Movement --> BaseMovement
    Anim --> BaseAnim
    Combat --> Collider
    Health --> Collider
    Variants --> Interfaces
```

## Principios utilizados

### Composicion

El cerebro no implementa el movimiento ni el dano directamente. Solicita servicios a componentes especializados mediante interfaces o referencias concretas.

### Separacion entre configuracion y estado

Los `ScriptableObject` contienen valores reutilizables. El estado temporal, como el objetivo actual, el cooldown restante o la coroutine activa, permanece en los componentes de escena.

### Consultas sin efectos secundarios

Las consultas de rango y disponibilidad no deben consumir una habilidad. La reserva de una habilidad ocurre unicamente al ejecutar `TryExecuteATK`.

### Eventos

Los eventos comunican cambios entre modulos sin acoplarlos directamente. Por ejemplo, la fachada notifica el inicio y el final de un ataque para que el cerebro detenga o reanude el movimiento.
