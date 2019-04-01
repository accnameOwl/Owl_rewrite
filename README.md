# Owl_rewrite
development repository for old gameproject


## object tree


/mob

    COMBAT_INVISIBLE(mob)
    COMBAT_ON_DEATH(mob)
    COMBAT_ON_RESPAWN(mob)
    COMBAT_ON_DAMAGE(mob, damage, ref)
    COMBAT_ON_REGEN(mob)




    player
        COMBAT_STATS()
        Login() ..()
        COMBAT_ON_DEATH() ..()
        
        inventory

        inventory_Find(player, item)
        inventory_Add(player, item)
        inventory_Remove(player, item)
        inventory_Replace(player, old_item, new_item)
        inventory_Recycle(player)
        inventory_Clear(player)

    npc
        COMBAT_ON_DEATH() ..()

        loot_array[]

        loot_array_clear()
        loot_array_check()
        loot_array_list2params()

Inventory
    content[]

    Find(item)
    Add(item)
    Remove(item)
    Replace(old_item, new_item)
    Recycle()
    Clear()

item
    itemLevel
    durability
    item_Slot
    mob/wielder
    stat_list[]
    effects[]

    stat_list_add(Stat)
    stat_list_remove(Stat)
    calculate_stat(Stat)
    itemStats_addTo(wielder)
    itemStats_remTo(wielder)

    Equip(wielder)
    Unequip(wielder)
    Use(Wielder)
    Drop(wielder)
