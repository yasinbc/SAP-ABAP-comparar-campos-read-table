*&---------------------------------------------------------------------*
*& Report ZEJERCICIO8_YBC
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zejercicio8_ybc.

DATA: tl_clientes TYPE TABLE OF ztybc_clientes,
      wa_cliente LIKE LINE OF tl_clientes,
      wl_claveclientes like ztybc_clientes-clavecliente,
      tl_kna1 type table of zkna1,
      wa_kna1 like line of tl_kna1,
      wl_clavekna1 like zkna1-clave.

SELECT * FROM ztybc_clientes INTO TABLE tl_clientes.
SELECT * FROM zkna1 INTO TABLE tl_kna1.

loop at tl_clientes into wa_cliente.
  read table tl_kna1 into wa_kna1 with key clave = wa_kna1-clave.
  if SY-SUBRC = 0.
    write:/ 'EXITO! Los campos son iguales'.
  else.
    write:/ 'ERROR! Los campos son distintos'.
  endif.
endloop.