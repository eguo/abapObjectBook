*&---------------------------------------------------------------------*
*& Report  Z_CREATE_EXAMPLE_DATA
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  Z_CREATE_EXAMPLE_DATA.

DATA:
customer_wa TYPE zcustomerz,
customer_tab TYPE HASHED TABLE OF zcustomerz WITH UNIQUE KEY id.
DATA:
car_wa TYPE zcars,
car_tab TYPE HASHED TABLE OF zcars WITH UNIQUE KEY license_plate.

START-OF-SELECTION.
  customer_wa-id = '00000001'.
  customer_wa-name = 'Haximilien Vomact'.
  INSERT customer_wa INTO TABLE customer_tab.
  customer_wa-id = '00000002'.
  customer_wa-name = 'Benjacomin Bozart'.
  INSERT customer_wa INTO TABLE customer_tab.
  customer_wa-id = '00000003'.
  customer_wa-name = 'Johanna Gnade'.
  INSERT customer_wa INTO TABLE customer_tab.
  customer_wa-id = '00000004'.
  customer_wa-name = 'Dolores Oh'.
  INSERT customer_wa INTO TABLE customer_tab.
* Update customer database table from internal table
  TRY.
      DELETE FROM zcustomerz.
      INSERT zcustomerz
      FROM TABLE customer_tab.
      IF sy-subrc = 0.
        MESSAGE 'Customer table updated' TYPE 'I'.
      ENDIF.
    CATCH cx_sy_open_sql_db.
      MESSAGE 'Customer table could not be updated' TYPE 'I' DISPLAY LIKE 'E'.
  ENDTRY.
* Fill internal car table
  car_wa-license_plate = '1234XX CA'.
  car_wa-category = 'F'.
  INSERT car_wa INTO TABLE car_tab.
  car_wa-license_plate = '5678YY NY'.
  car_wa-category = 'F'.
  INSERT car_wa INTO TABLE car_tab.
  car_wa-license_plate = '4321ZZ NV'.
  car_wa-category = 'F'.
  INSERT car_wa INTO TABLE car_tab.
  car_wa-license_plate = '5522HH NC'.
  car_wa-category = 'H'.
  INSERT car_wa INTO TABLE car_tab.
  car_wa-license_plate = '1717WWAZ'.
  car_wa-category = 'C'.
  INSERT car_wa INTO TABLE car_tab.
* Update car database table from internal table
  TRY.
      DELETE FROM zcars.
      INSERT zcars
      FROM TABLE car_tab.
      IF sy-subrc = 0.
        MESSAGE 'Car table updated' TYPE 'I'.
      ENDIF.
    CATCH cx_sy_open_sql_db.
      MESSAGE 'Car table could not be updated' TYPE 'I' DISPLAY LIKE 'E'.
  ENDTRY.