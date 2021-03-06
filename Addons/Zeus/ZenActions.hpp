class zen_context_menu_actions {
    class FOBParent {
        displayName = "Create Portable FOB";
        icon = "";
        statement = "";
        condition = "_hoveredEntity call LR_fnc_canBeFOB";
        priority = 50;
        class FOBCamp {
            displayName = "Camp";
            icon = "";
            statement = "[_args] call LR_fnc_FOBZeusWrapper";
            priority = 50;
            args = 0;
        };
        class FOBSmall : FOBCamp {
            displayName = "Small";
            icon = "";
            priority = 49;
            args = 1;
        };
        class FOBMedium : FOBCamp {
            displayName = "Medium";
            icon = "";
            priority = 48;
            args = 2;
        };
        class FOBLarge : FOBCamp {
            displayName = "Large";
            icon = "";
            priority = 47;
            args = 3;
        };
    };

    class MedFacility {
        displayName = "Set Medical Facility";
        icon = "z\LRG Fundamentals\addons\Media\images\icons\Medical Area.paa";
        statement = "[_hoveredEntity] remoteExec [""LR_fnc_setMedicalFacility"", 0, true]";
        condition = "_hoveredEntity call LR_fnc_canBeMedFacility";
        priority = 51;
    };
};