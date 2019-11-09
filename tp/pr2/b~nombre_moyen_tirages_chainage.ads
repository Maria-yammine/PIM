pragma Ada_95;
pragma Warnings (Off);
with System;
package ada_main is

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: 7.4.0" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_nombre_moyen_tirages_chainage" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#a84aa79b#;
   pragma Export (C, u00001, "nombre_moyen_tirages_chainageB");
   u00002 : constant Version_32 := 16#b6df930e#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#7ec093d3#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#76789da1#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#e18a47a0#;
   pragma Export (C, u00005, "ada__float_text_ioB");
   u00006 : constant Version_32 := 16#af9f2fd5#;
   pragma Export (C, u00006, "ada__float_text_ioS");
   u00007 : constant Version_32 := 16#c2326fda#;
   pragma Export (C, u00007, "ada__exceptionsB");
   u00008 : constant Version_32 := 16#6e98a13f#;
   pragma Export (C, u00008, "ada__exceptionsS");
   u00009 : constant Version_32 := 16#e947e6a9#;
   pragma Export (C, u00009, "ada__exceptions__last_chance_handlerB");
   u00010 : constant Version_32 := 16#41e5552e#;
   pragma Export (C, u00010, "ada__exceptions__last_chance_handlerS");
   u00011 : constant Version_32 := 16#4635ec04#;
   pragma Export (C, u00011, "systemS");
   u00012 : constant Version_32 := 16#4e7785b8#;
   pragma Export (C, u00012, "system__soft_linksB");
   u00013 : constant Version_32 := 16#d8b13451#;
   pragma Export (C, u00013, "system__soft_linksS");
   u00014 : constant Version_32 := 16#b01dad17#;
   pragma Export (C, u00014, "system__parametersB");
   u00015 : constant Version_32 := 16#381fe17b#;
   pragma Export (C, u00015, "system__parametersS");
   u00016 : constant Version_32 := 16#30ad09e5#;
   pragma Export (C, u00016, "system__secondary_stackB");
   u00017 : constant Version_32 := 16#fca7137e#;
   pragma Export (C, u00017, "system__secondary_stackS");
   u00018 : constant Version_32 := 16#f103f468#;
   pragma Export (C, u00018, "system__storage_elementsB");
   u00019 : constant Version_32 := 16#6bf6a600#;
   pragma Export (C, u00019, "system__storage_elementsS");
   u00020 : constant Version_32 := 16#41837d1e#;
   pragma Export (C, u00020, "system__stack_checkingB");
   u00021 : constant Version_32 := 16#c88a87ec#;
   pragma Export (C, u00021, "system__stack_checkingS");
   u00022 : constant Version_32 := 16#87a448ff#;
   pragma Export (C, u00022, "system__exception_tableB");
   u00023 : constant Version_32 := 16#1b9b8546#;
   pragma Export (C, u00023, "system__exception_tableS");
   u00024 : constant Version_32 := 16#ce4af020#;
   pragma Export (C, u00024, "system__exceptionsB");
   u00025 : constant Version_32 := 16#2e5681f2#;
   pragma Export (C, u00025, "system__exceptionsS");
   u00026 : constant Version_32 := 16#843d48dc#;
   pragma Export (C, u00026, "system__exceptions__machineS");
   u00027 : constant Version_32 := 16#aa0563fc#;
   pragma Export (C, u00027, "system__exceptions_debugB");
   u00028 : constant Version_32 := 16#38bf15c0#;
   pragma Export (C, u00028, "system__exceptions_debugS");
   u00029 : constant Version_32 := 16#6c2f8802#;
   pragma Export (C, u00029, "system__img_intB");
   u00030 : constant Version_32 := 16#44ee0cc6#;
   pragma Export (C, u00030, "system__img_intS");
   u00031 : constant Version_32 := 16#39df8c17#;
   pragma Export (C, u00031, "system__tracebackB");
   u00032 : constant Version_32 := 16#181732c0#;
   pragma Export (C, u00032, "system__tracebackS");
   u00033 : constant Version_32 := 16#9ed49525#;
   pragma Export (C, u00033, "system__traceback_entriesB");
   u00034 : constant Version_32 := 16#466e1a74#;
   pragma Export (C, u00034, "system__traceback_entriesS");
   u00035 : constant Version_32 := 16#6fd210f2#;
   pragma Export (C, u00035, "system__traceback__symbolicB");
   u00036 : constant Version_32 := 16#dd19f67a#;
   pragma Export (C, u00036, "system__traceback__symbolicS");
   u00037 : constant Version_32 := 16#701f9d88#;
   pragma Export (C, u00037, "ada__exceptions__tracebackB");
   u00038 : constant Version_32 := 16#20245e75#;
   pragma Export (C, u00038, "ada__exceptions__tracebackS");
   u00039 : constant Version_32 := 16#9f00b3d3#;
   pragma Export (C, u00039, "system__address_imageB");
   u00040 : constant Version_32 := 16#e7d9713e#;
   pragma Export (C, u00040, "system__address_imageS");
   u00041 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00041, "system__wch_conB");
   u00042 : constant Version_32 := 16#5d48ced6#;
   pragma Export (C, u00042, "system__wch_conS");
   u00043 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00043, "system__wch_stwB");
   u00044 : constant Version_32 := 16#7059e2d7#;
   pragma Export (C, u00044, "system__wch_stwS");
   u00045 : constant Version_32 := 16#a831679c#;
   pragma Export (C, u00045, "system__wch_cnvB");
   u00046 : constant Version_32 := 16#52ff7425#;
   pragma Export (C, u00046, "system__wch_cnvS");
   u00047 : constant Version_32 := 16#5ab55268#;
   pragma Export (C, u00047, "interfacesS");
   u00048 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00048, "system__wch_jisB");
   u00049 : constant Version_32 := 16#d28f6d04#;
   pragma Export (C, u00049, "system__wch_jisS");
   u00050 : constant Version_32 := 16#1d1c6062#;
   pragma Export (C, u00050, "ada__text_ioB");
   u00051 : constant Version_32 := 16#e1e47390#;
   pragma Export (C, u00051, "ada__text_ioS");
   u00052 : constant Version_32 := 16#10558b11#;
   pragma Export (C, u00052, "ada__streamsB");
   u00053 : constant Version_32 := 16#67e31212#;
   pragma Export (C, u00053, "ada__streamsS");
   u00054 : constant Version_32 := 16#92d882c5#;
   pragma Export (C, u00054, "ada__io_exceptionsS");
   u00055 : constant Version_32 := 16#3d17c74c#;
   pragma Export (C, u00055, "ada__tagsB");
   u00056 : constant Version_32 := 16#5a4e344a#;
   pragma Export (C, u00056, "ada__tagsS");
   u00057 : constant Version_32 := 16#c3335bfd#;
   pragma Export (C, u00057, "system__htableB");
   u00058 : constant Version_32 := 16#c2f75fee#;
   pragma Export (C, u00058, "system__htableS");
   u00059 : constant Version_32 := 16#089f5cd0#;
   pragma Export (C, u00059, "system__string_hashB");
   u00060 : constant Version_32 := 16#60a93490#;
   pragma Export (C, u00060, "system__string_hashS");
   u00061 : constant Version_32 := 16#72b39087#;
   pragma Export (C, u00061, "system__unsigned_typesS");
   u00062 : constant Version_32 := 16#afdbf393#;
   pragma Export (C, u00062, "system__val_lluB");
   u00063 : constant Version_32 := 16#0841c7f5#;
   pragma Export (C, u00063, "system__val_lluS");
   u00064 : constant Version_32 := 16#27b600b2#;
   pragma Export (C, u00064, "system__val_utilB");
   u00065 : constant Version_32 := 16#ea955afa#;
   pragma Export (C, u00065, "system__val_utilS");
   u00066 : constant Version_32 := 16#d1060688#;
   pragma Export (C, u00066, "system__case_utilB");
   u00067 : constant Version_32 := 16#623c85d3#;
   pragma Export (C, u00067, "system__case_utilS");
   u00068 : constant Version_32 := 16#4c01b69c#;
   pragma Export (C, u00068, "interfaces__c_streamsB");
   u00069 : constant Version_32 := 16#b1330297#;
   pragma Export (C, u00069, "interfaces__c_streamsS");
   u00070 : constant Version_32 := 16#36a43a0a#;
   pragma Export (C, u00070, "system__crtlS");
   u00071 : constant Version_32 := 16#4db84b5a#;
   pragma Export (C, u00071, "system__file_ioB");
   u00072 : constant Version_32 := 16#e1440d61#;
   pragma Export (C, u00072, "system__file_ioS");
   u00073 : constant Version_32 := 16#86c56e5a#;
   pragma Export (C, u00073, "ada__finalizationS");
   u00074 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00074, "system__finalization_rootB");
   u00075 : constant Version_32 := 16#09c79f94#;
   pragma Export (C, u00075, "system__finalization_rootS");
   u00076 : constant Version_32 := 16#769e25e6#;
   pragma Export (C, u00076, "interfaces__cB");
   u00077 : constant Version_32 := 16#70be4e8c#;
   pragma Export (C, u00077, "interfaces__cS");
   u00078 : constant Version_32 := 16#cc2ce7a7#;
   pragma Export (C, u00078, "system__os_libB");
   u00079 : constant Version_32 := 16#c1e9580f#;
   pragma Export (C, u00079, "system__os_libS");
   u00080 : constant Version_32 := 16#1a817b8e#;
   pragma Export (C, u00080, "system__stringsB");
   u00081 : constant Version_32 := 16#388afd62#;
   pragma Export (C, u00081, "system__stringsS");
   u00082 : constant Version_32 := 16#bbaa76ac#;
   pragma Export (C, u00082, "system__file_control_blockS");
   u00083 : constant Version_32 := 16#d5f9759f#;
   pragma Export (C, u00083, "ada__text_io__float_auxB");
   u00084 : constant Version_32 := 16#f854caf5#;
   pragma Export (C, u00084, "ada__text_io__float_auxS");
   u00085 : constant Version_32 := 16#181dc502#;
   pragma Export (C, u00085, "ada__text_io__generic_auxB");
   u00086 : constant Version_32 := 16#a6c327d3#;
   pragma Export (C, u00086, "ada__text_io__generic_auxS");
   u00087 : constant Version_32 := 16#8aa4f090#;
   pragma Export (C, u00087, "system__img_realB");
   u00088 : constant Version_32 := 16#819dbde6#;
   pragma Export (C, u00088, "system__img_realS");
   u00089 : constant Version_32 := 16#42a257f7#;
   pragma Export (C, u00089, "system__fat_llfS");
   u00090 : constant Version_32 := 16#1b28662b#;
   pragma Export (C, u00090, "system__float_controlB");
   u00091 : constant Version_32 := 16#a6c9af38#;
   pragma Export (C, u00091, "system__float_controlS");
   u00092 : constant Version_32 := 16#3e932977#;
   pragma Export (C, u00092, "system__img_lluB");
   u00093 : constant Version_32 := 16#3b7a9044#;
   pragma Export (C, u00093, "system__img_lluS");
   u00094 : constant Version_32 := 16#ec78c2bf#;
   pragma Export (C, u00094, "system__img_unsB");
   u00095 : constant Version_32 := 16#ed47ac70#;
   pragma Export (C, u00095, "system__img_unsS");
   u00096 : constant Version_32 := 16#16458a73#;
   pragma Export (C, u00096, "system__powten_tableS");
   u00097 : constant Version_32 := 16#faa9a7b2#;
   pragma Export (C, u00097, "system__val_realB");
   u00098 : constant Version_32 := 16#b81c9b15#;
   pragma Export (C, u00098, "system__val_realS");
   u00099 : constant Version_32 := 16#b2a569d2#;
   pragma Export (C, u00099, "system__exn_llfB");
   u00100 : constant Version_32 := 16#fa4b57d8#;
   pragma Export (C, u00100, "system__exn_llfS");
   u00101 : constant Version_32 := 16#1e40f010#;
   pragma Export (C, u00101, "system__fat_fltS");
   u00102 : constant Version_32 := 16#cd2959fb#;
   pragma Export (C, u00102, "ada__numericsS");
   u00103 : constant Version_32 := 16#24560dec#;
   pragma Export (C, u00103, "aleaB");
   u00104 : constant Version_32 := 16#9fe1c6b1#;
   pragma Export (C, u00104, "aleaS");
   u00105 : constant Version_32 := 16#d34f9f29#;
   pragma Export (C, u00105, "system__random_numbersB");
   u00106 : constant Version_32 := 16#852d5c9e#;
   pragma Export (C, u00106, "system__random_numbersS");
   u00107 : constant Version_32 := 16#40a8df0e#;
   pragma Export (C, u00107, "system__random_seedB");
   u00108 : constant Version_32 := 16#1d25c55f#;
   pragma Export (C, u00108, "system__random_seedS");
   u00109 : constant Version_32 := 16#0d7f1a43#;
   pragma Export (C, u00109, "ada__calendarB");
   u00110 : constant Version_32 := 16#5b279c75#;
   pragma Export (C, u00110, "ada__calendarS");
   u00111 : constant Version_32 := 16#d083f760#;
   pragma Export (C, u00111, "system__os_primitivesB");
   u00112 : constant Version_32 := 16#ccbafd72#;
   pragma Export (C, u00112, "system__os_primitivesS");
   u00113 : constant Version_32 := 16#1d9142a4#;
   pragma Export (C, u00113, "system__val_unsB");
   u00114 : constant Version_32 := 16#621b7dbc#;
   pragma Export (C, u00114, "system__val_unsS");
   u00115 : constant Version_32 := 16#9b3c79ff#;
   pragma Export (C, u00115, "ensembles_chainageB");
   u00116 : constant Version_32 := 16#42b1abe8#;
   pragma Export (C, u00116, "ensembles_chainageS");
   u00117 : constant Version_32 := 16#52f1910f#;
   pragma Export (C, u00117, "system__assertionsB");
   u00118 : constant Version_32 := 16#8bb8c090#;
   pragma Export (C, u00118, "system__assertionsS");
   u00119 : constant Version_32 := 16#a6359005#;
   pragma Export (C, u00119, "system__memoryB");
   u00120 : constant Version_32 := 16#1f488a30#;
   pragma Export (C, u00120, "system__memoryS");
   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  interfaces%s
   --  system%s
   --  system.case_util%s
   --  system.case_util%b
   --  system.exn_llf%s
   --  system.exn_llf%b
   --  system.float_control%s
   --  system.float_control%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.os_primitives%s
   --  system.os_primitives%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.powten_table%s
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%s
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  system.unsigned_types%s
   --  system.fat_flt%s
   --  system.fat_llf%s
   --  system.img_llu%s
   --  system.img_llu%b
   --  system.img_uns%s
   --  system.img_uns%b
   --  system.img_real%s
   --  system.img_real%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%s
   --  system.wch_cnv%b
   --  system.traceback%s
   --  system.traceback%b
   --  system.wch_stw%s
   --  system.standard_library%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  ada.exceptions%s
   --  system.wch_stw%b
   --  ada.exceptions.traceback%s
   --  system.soft_links%s
   --  system.exception_table%s
   --  system.exception_table%b
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.secondary_stack%s
   --  system.address_image%s
   --  system.soft_links%b
   --  ada.exceptions.last_chance_handler%s
   --  system.memory%s
   --  system.memory%b
   --  ada.exceptions.traceback%b
   --  system.traceback.symbolic%s
   --  system.traceback.symbolic%b
   --  system.exceptions.machine%s
   --  system.secondary_stack%b
   --  system.address_image%b
   --  ada.exceptions.last_chance_handler%b
   --  system.standard_library%b
   --  ada.exceptions%b
   --  ada.io_exceptions%s
   --  ada.numerics%s
   --  interfaces.c%s
   --  interfaces.c%b
   --  system.os_lib%s
   --  system.os_lib%b
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_llu%s
   --  system.val_llu%b
   --  ada.tags%s
   --  ada.tags%b
   --  ada.streams%s
   --  ada.streams%b
   --  system.file_control_block%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  system.file_io%s
   --  system.file_io%b
   --  system.val_real%s
   --  system.val_real%b
   --  system.val_uns%s
   --  system.val_uns%b
   --  ada.calendar%s
   --  ada.calendar%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  ada.text_io.generic_aux%s
   --  ada.text_io.generic_aux%b
   --  ada.text_io.float_aux%s
   --  ada.text_io.float_aux%b
   --  ada.float_text_io%s
   --  ada.float_text_io%b
   --  system.assertions%s
   --  system.assertions%b
   --  system.random_seed%s
   --  system.random_seed%b
   --  system.random_numbers%s
   --  system.random_numbers%b
   --  alea%s
   --  alea%b
   --  ensembles_chainage%s
   --  ensembles_chainage%b
   --  nombre_moyen_tirages_chainage%b
   --  END ELABORATION ORDER


end ada_main;
