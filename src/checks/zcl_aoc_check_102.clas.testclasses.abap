CLASS ltc_test DEFINITION FOR TESTING DURATION SHORT RISK LEVEL HARMLESS FINAL.

  PRIVATE SECTION.
    DATA: mt_code   TYPE string_table,
          ms_result TYPE scirest_ad,
          mo_check  TYPE REF TO zcl_aoc_check_102.

    METHODS:
      setup,
      export_import FOR TESTING,
      constant_ok FOR TESTING RAISING cx_static_check.

ENDCLASS.

CLASS ltc_test IMPLEMENTATION.

  DEFINE _code.
    APPEND &1 TO mt_code.
  END-OF-DEFINITION.

  METHOD setup.
    CREATE OBJECT mo_check.
    zcl_aoc_unit_test=>set_check( mo_check ).
  ENDMETHOD.

  METHOD export_import.
    zcl_aoc_unit_test=>export_import( mo_check ).
  ENDMETHOD.

  METHOD constant_ok.
    _code `CONSTANTS c_hello TYPE string VALUE 'Bar'.`.
    _code `CONSTANTS c_hello TYPE string VALUE 'Bar'.`.

    ms_result = zcl_aoc_unit_test=>check( mt_code ).

    cl_abap_unit_assert=>assert_initial( ms_result ).
  ENDMETHOD.

ENDCLASS.
