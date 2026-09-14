---
title: Referencia API
uid: api-index
---

# Referencia API

Referencia generada automaticamente desde los comentarios XML del ensamblado Isai.Enemies.

> Esta pagina se regenera con Documentation/build-docs.ps1; no edites su contenido manualmente.

## `BaseAnim<T>`

Clase base para controlar animaciones mediante estados genéricos y hashes de Animator.

| Miembro | Descripcion |
|---|---|
| `BaseAnim<T>.InitializeAnimHashes` | Mapea automáticamente cada valor del Enum a un Hash de Animator con el mismo nombre. |
| `BaseAnim<T>.PlayStateAnimation(`0)` | Transiciona el Animator al estado correspondiente usando el Hash en caché. |

## `BaseCollider`

Componente base para filtrar colisiones y exponer eventos de entrada, salida y permanencia.

## `BaseEntityStats`

Clase base abstracta que representa las estadísticas de una entidad en el juego. Hereda de ScriptableObject e implementa la interfaz .

| Miembro | Descripcion |
|---|---|
| `BaseEntityStats.BaseDamage` | Obtiene el daño base que inflige la entidad. |
| `BaseEntityStats.MaxHealth` | Obtiene la salud máxima de la entidad. |
| `BaseEntityStats.Patient` | Obtiene el nivel de paciencia o templanza de la entidad. |
| `BaseEntityStats.Speed` | Obtiene la velocidad de movimiento de la entidad. |

## `BaseHealth`

Componente base para administrar salud, daño, muerte y curación gradual de una entidad.

## `BaseMovement`

Clase base para el movimiento de entidades utilizando un . Implementa la interfaz para proporcionar control de navegación y rutas.

| Miembro | Descripcion |
|---|---|
| `BaseMovement._agent` | Referencia interna en caché al componente . |
| `BaseMovement._canDebug` | Indica si se deben habilitar las funciones de depuración y visualización en el editor. |
| `BaseMovement._nodeColor` | Color de las esferas que representan los nodos del camino en la depuración de Gizmos. |
| `BaseMovement._pathColor` | Color de la línea que representa el camino (path) en la depuración de Gizmos. |
| `BaseMovement._speed` | Velocidad interna en caché para el movimiento de la entidad. |
| `BaseMovement.Awake` | Inicializa las referencias del componente y configura la velocidad inicial. |
| `BaseMovement.OnDrawGizmos` | Dibuja elementos visuales de depuración en la vista de Escena de Unity, como la ruta del agente y los nodos de navegación. |
| `BaseMovement.ResetDestination` | Restablece el destino actual y limpia el flag que indica si tiene destino. |
| `BaseMovement.Update` | Actualiza el estado del movimiento en cada frame, manejando la depuración si está habilitada. |

## `BaseSkill`

Clase base para las habilidades de combate instanciables, incluyendo daño, VFX, colisiones y autodestrucción.

## `EnemyAnim`

Especialización del sistema de animación para los estados propios de un enemigo.

## `EnemyBrain`

Controla la máquina de estados del enemigo, sus objetivos, movimiento, combate y retorno a su posición inicial.

## `EnemyCombat`

Coordina la ejecución de ataques del enemigo y comunica sus eventos de inicio y finalización.

## `EnemyCombatFacade`

Gestiona la selección rotativa de habilidades, sus cooldowns y la duración de cada ataque.

## `EnemyData`

Mantiene y distribuye las estadísticas actuales de un enemigo a través de eventos de cambio.

## `EnemyHealth`

Especialización del sistema de salud para enemigos, con estadísticas y daño recibidos desde sus datos.

## `EnemyMovement`

Especialización del movimiento de entidades que obtiene su velocidad desde los datos del enemigo.

## `Enum_AtkList`

Define los tipos de ataque disponibles para los enemigos.

| Miembro | Descripcion |
|---|---|
| `Enum_AtkList.Dash` | Ataque de embestida rápida hacia el objetivo. |
| `Enum_AtkList.Pierce` | Ataque que atraviesa al objetivo en línea recta. |

## `Enum_EnemyAnim`

Identifica los estados de animación disponibles para un enemigo.

## `Enum_EnemyStats`

Identifica las categorías de estadísticas que pueden modificarse en un enemigo.

## `IAnim<T>`

Interfaz [ IAnim ]: Expone la animación actual, sus métodos para manejarlos y el evento que se invoca al cambiar de animación

| Miembro | Descripcion |
|---|---|
| `IAnim<T>.ChangeState(`0)` | Método para transicionar entre estados |
| `IAnim<T>.CurrentState` | El estado de animación actual |
| `IAnim<T>.OnAnimChanged` | Evento que se invoca cuando la animación cambia |
| `IAnim<T>.ToggleAnim(System.Int32,System.Boolean)` | Método para cambiar el parámetro de animación del Animator |
| `IAnim<T>.ToggleAnim(System.String,System.Boolean)` | Método para cambiar el parámetro de animación del Animator |

## `IAttackData`

Interfaz que define las propiedades necesarias para el ataque de un enemigo.

| Miembro | Descripcion |
|---|---|
| `IAttackData.AttackDamage` | Obtiene el daño que inflige el ataque. |
| `IAttackData.AttackDuration` | Obtiene la duración del ataque |
| `IAttackData.Cooldown` | Obtiene el tiempo de enfriamiento (cooldown) del ataque en segundos. |
| `IAttackData.NameAttack` | Obtiene el nombre del ataque. |
| `IAttackData.Range` | Obtiene el rango de alcance del ataque. |

## `IBaseATK`

Define el contrato básico de un ataque ejecutable por una entidad.

## `ICollider`

Interfaz que expone el comportamiento básico de un colisionador junto a sus métodos y eventos útiles.

| Miembro | Descripcion |
|---|---|
| `ICollider.CurrentCollider` | Obtiene el colisionador actual. |
| `ICollider.DisableCollider` | Desactiva el colisionador. |
| `ICollider.EnableCollider` | Activa el colisionador. |
| `ICollider.OnObjectEnter` | Evento que se activa cuando un objeto entra en el colisionador. |
| `ICollider.OnObjectExit` | Evento que se activa cuando un objeto sale del colisionador. |
| `ICollider.OnObjectStay` | Evento que se activa cuando un objeto permanece dentro de un collisionador |
| `ICollider.TryGetCollider`<T>(``0@)` | Método para obtener de forma segura el Collider referenciado en su script y comprobar si es del tipo que se busca |

## `ICombat`

Interfaz que define el comportamiento y las propiedades del sistema de combate.

| Miembro | Descripcion |
|---|---|
| `ICombat.AttackIsReady` | Método para conocer si la habilidad esta disponible |
| `ICombat.AttackIsReady(System.Int32)` | Método para conocer si la habilidad esta disponible |
| `ICombat.Cooldowns` | Obtiene los tiempos de recarga de las habilidades o ataques. |
| `ICombat.CurrentAttack` | Obtiene el identificador o nombre del ataque actual. |
| `ICombat.CurrentRange` | Obtiene el rango de ataque actual. |
| `ICombat.ExecuteAttack(UnityEngine.Transform)` | Ejecuta un ataque utilizando datos específicos. |
| `ICombat.OnAttackEnd` | Evento que se activa cuando finaliza un ataque. |
| `ICombat.OnAttackStart` | Evento que se activa cuando comienza un ataque. |
| `ICombat.RestoreCooldowns` | Restablece los tiempos de recarga de los ataques. |

## `IData<T>`

Contrato genérico para componentes que manejan o exponen un contenedor de datos de tipo .

| Miembro | Descripcion |
|---|---|
| `IData<T>.GetData` | Obtiene una copia de los datos actuales. |
| `IData<T>.OnDataChanged` | Evento que se dispara cuando los datos cambian. |
| `IData<T>.SetData(`0)` | Actualiza los datos actuales por completo. |

## `IDealDamage`

Interfaz [ IDealDamage ]: Expone el método DealDamage() para obtener el daño final que el objeto puede producir.

| Miembro | Descripcion |
|---|---|
| `IDealDamage.DealDamage` | Método que retorna el daño final que el objeto puede producir. |
| `IDealDamage.OnDamageDealed` | Evento invocado al momento de inflingir daño |

## `IEnemyBrain<T>`

Interfaz que define el comportamiento del cerebro de un enemigo.

| Miembro | Descripcion |
|---|---|
| `IEnemyBrain<T>.ChangeState(`0)` | Cambia el estado actual del enemigo. |
| `IEnemyBrain<T>.ChangeState(`0,UnityEngine.Transform)` | Cambia el estado actual del enemigo y asigna un nuevo objetivo. |
| `IEnemyBrain<T>.ChangeTarget(UnityEngine.Transform)` | Cambia el objetivo actual del enemigo. |
| `IEnemyBrain<T>.OnStateChanged` | Evento que se invoca cada vez que un enemigo cambia su estado |
| `IEnemyBrain<T>.OnTargetChanged` | Evento que se invoca cada vez que el target del enemigo cambia |
| `IEnemyBrain<T>.Target` | Obtiene el objetivo actual del enemigo. |
| `IEnemyBrain<T>.TryGetTarget(UnityEngine.Transform@)` | Intenta obtener el objetivo actual del enemigo. |

## `IEntityStats`

Define las estadísticas básicas de una entidad en el juego.

| Miembro | Descripcion |
|---|---|
| `IEntityStats.BaseDamage` | Obtiene el daño base que inflige la entidad. |
| `IEntityStats.MaxHealth` | Obtiene la salud máxima de la entidad. |
| `IEntityStats.Patient` | Obtiene la paciencia de la entidad: Tiempo que puede estar fuera de su área de spawn |
| `IEntityStats.Speed` | Obtiene la velocidad de movimiento de la entidad. |

## `IHealth`

Define la interfaz para el manejo de la salud de una entidad.

| Miembro | Descripcion |
|---|---|
| `IHealth.ChangeHealth(System.Int32)` | Modifica la salud actual por la cantidad especificada. |
| `IHealth.CurrentHealth` | Obtiene la salud actual de la entidad. |
| `IHealth.Kill` | Mata inmediatamente a la entidad. |
| `IHealth.OnDead` | Evento que se dispara cuando la entidad muere. |
| `IHealth.OnHealthChanged` | Evento que se dispara cuando el valor de la salud cambia. |
| `IHealth.StartHealing` | Inicia el proceso de curación de la entidad. |
| `IHealth.StopHealing` | Detiene el proceso de curación de la entidad. |

## `IMovement`

Interfaz que define las operaciones y propiedades para el movimiento de una entidad.

| Miembro | Descripcion |
|---|---|
| `IMovement.CleanMovement` | Limpia por completo el estado del movimiento actual. |
| `IMovement.CurrentDestination` | Obtiene el destino actual del movimiento, si existe. |
| `IMovement.CurrentPath` | Obtiene la ruta de navegación actual del NavMesh. |
| `IMovement.GetDistanceFromTarget` | Obtiene la distancia en línea recta desde la entidad hasta el objetivo. |
| `IMovement.GetRemainDistance` | Obtiene la distancia restante en el camino actual hacia el destino. |
| `IMovement.HasDestination` | Obtiene un booleano verdadero si existe un destino o path |
| `IMovement.HasReached` | Verifica si la entidad ha llegado a su destino. |
| `IMovement.Move2Target(UnityEngine.Transform)` | Mueve la entidad hacia el objetivo especificado. |
| `IMovement.Move2Target(UnityEngine.Vector3)` | Mueve la entidad hacia la posición destino especificada. |
| `IMovement.ResumeMovement` | Reanuda el movimiento previamente detenido de la entidad. |
| `IMovement.StopMovement` | Detiene temporalmente el movimiento de la entidad. |
| `IMovement.TryGetDestination(UnityEngine.Vector3@)` | Intenta obtener el destino de movimiento actual. |
| `IMovement.TryGetPath(UnityEngine.AI.NavMeshPath@)` | Intenta obtener la ruta de navegación actual. |

## `IPrefabSkill`

Define los datos y la inicialización requeridos por un prefab de habilidad.

## `ITakeDamage`

Interfaz [ ITakeDamage ]: Expone el método TakeDamage() para recibir daño

| Miembro | Descripcion |
|---|---|
| `ITakeDamage.OnDamaged` | Evento invocado al sufrir daño |
| `ITakeDamage.TakeDamage(System.Int32)` | Método para recibir daño de objetos con la interfaz de [ IDealDamage ] |

## `PiercingSkill`

Habilidad de ataque perforante basada en .

## `SlashSkill`

Habilidad de ataque de corte que ajusta el radio de su collider al rango configurado.

## `SO_EnemyStats`

Representa las estadísticas base de un enemigo como un ScriptableObject.

| Miembro | Descripcion |
|---|---|
| `SO_EnemyStats.GetEnemyStats` | Devuelve las estadísticas completas empaquetadas en un struct seguro y sin costo de GC. |

## `SO_SkillData`

ScriptableObject que centraliza los parámetros reutilizables de una habilidad de combate.

| Miembro | Descripcion |
|---|---|
| `SO_SkillData.CanDealDamage` | Indica si la habilidad puede infligir daño. |
| `SO_SkillData.ShouldDestroyUponCollision` | Indica si la habilidad debe destruirse al colisionar. |
| `SO_SkillData.ShouldDestroyWhenVfxEnd` | Indica si la habilidad debe destruirse cuando termina su VFX. |
| `SO_SkillData.ShouldFollow` | Indica si el objeto de la habilidad debe permanecer unido a su spawner. |
| `SO_SkillData.SkillCooldown` | Tiempo de enfriamiento de la habilidad, expresado en segundos. |
| `SO_SkillData.SkillDamage` | Daño propio de la habilidad. |
| `SO_SkillData.SkillDuration` | Duración activa de la habilidad, expresada en segundos. |
| `SO_SkillData.SkillRange` | Distancia máxima a la que puede alcanzar la habilidad. |
| `SO_SkillData.SkillSelfDestructionTimer` | Tiempo máximo antes de destruir automáticamente el objeto de la habilidad. |
| `SO_SkillData.VfxList` | Lista de variantes visuales disponibles para la habilidad. |
| `SO_SkillData.VfxOffset` | Desplazamiento local del VFX respecto a la habilidad. |
| `SO_SkillData.VfxScale` | Escala aplicada al VFX instanciado. |

## `Struct_EnemyStatsData`

Representa los datos de estadísticas de un enemigo.

| Miembro | Descripcion |
|---|---|
| `Struct_EnemyStatsData.#ctor(System.Int32,System.Single,System.Single,System.Single,System.Single)` | Inicializa una nueva instancia de la estructura . |
| `Struct_EnemyStatsData.BaseDamage` | El daño base infligido por el enemigo. |
| `Struct_EnemyStatsData.MaxHealth` | La vida máxima del enemigo. |
| `Struct_EnemyStatsData.Patience` | La paciencia o tolerancia del enemigo antes de perder el interés. |
| `Struct_EnemyStatsData.Speed` | La velocidad de movimiento del enemigo. |

## `Struct_FinalCombatData`

Contiene la configuración final de una habilidad después de asociar un ataque con su prefab y VFX.
