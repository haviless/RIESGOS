object DM1: TDM1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 56
  Top = 5
  Height = 780
  Width = 1310
  object DCOM1: TSocketConnection
    ServerName = 'SrvAplCob.srvDMCob'
    Left = 8
    Top = 8
  end
  object cdsUsuarios: TwwClientDataSet
    Aggregates = <>
    IndexFieldNames = 'USERID'
    Params = <>
    ProviderName = 'dspUsuario'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 54
    Top = 9
  end
  object dsUsuarios: TwwDataSource
    DataSet = cdsUsuarios
    Left = 54
    Top = 22
  end
  object cdsGrupos: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGrupos'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 112
    Top = 9
  end
  object dsGrupos: TwwDataSource
    DataSet = cdsGrupos
    Left = 112
    Top = 22
  end
  object cdsMGrupo: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMGrupo'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 168
    Top = 9
  end
  object dsMGrupo: TwwDataSource
    DataSet = cdsMGrupo
    Left = 168
    Top = 22
  end
  object cdsAcceso: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAcceso'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 219
    Top = 9
  end
  object dsAcceso: TwwDataSource
    DataSet = cdsAcceso
    Left = 219
    Top = 22
  end
  object cdsDLabo: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDLabo'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 331
    Top = 9
  end
  object dsDLabo: TwwDataSource
    DataSet = cdsDLabo
    Left = 330
    Top = 22
  end
  object cdsDFam: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDFam'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 384
    Top = 9
  end
  object dsDFam: TwwDataSource
    DataSet = cdsDFam
    Left = 387
    Top = 29
  end
  object cdsEjecuta: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvEjecuta'
    RemoteServer = DCOM1
    OnReconcileError = cdsEjecutaReconcileError
    ValidateWithMask = True
    Left = 15
    Top = 198
  end
  object dsEjecuta: TwwDataSource
    DataSet = cdsEjecuta
    Left = 15
    Top = 211
  end
  object cdsAso: TwwClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'prvAso'
    RemoteServer = DCOM1
    OnReconcileError = cdsEjecutaReconcileError
    PictureMasks.Strings = (
      'ASORUC'#9'###########'#9'T'#9'F'
      'ASOID'#9'*15[#]'#9'T'#9'F'
      'ASONUMDIR'#9'*5[#]'#9'T'#9'F'
      'ASODPTO'#9'*5[#]'#9'T'#9'F'
      'ASORESNOM'#9'*15[#]'#9'T'#9'F')
    ValidateWithMask = True
    Left = 267
    Top = 9
  end
  object dsAso: TwwDataSource
    DataSet = cdsAso
    Left = 267
    Top = 22
  end
  object cdsCtasBco: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCtasBco'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 440
    Top = 9
  end
  object dsCtasBco: TwwDataSource
    DataSet = cdsCtasBco
    Left = 443
    Top = 22
  end
  object cdsResol: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvResol'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 494
    Top = 9
  end
  object dsResol: TwwDataSource
    DataSet = cdsResol
    Left = 494
    Top = 22
  end
  object cdsDSocioE: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDSocioE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 553
    Top = 9
  end
  object dsDSocioE: TwwDataSource
    DataSet = cdsDSocioE
    Left = 554
    Top = 22
  end
  object cdsUSES: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvUSES'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 12
    Top = 70
  end
  object dsUSES: TwwDataSource
    DataSet = cdsUSES
    Left = 12
    Top = 83
  end
  object cdsUPro: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvUPro'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 58
    Top = 70
  end
  object dsUPro: TwwDataSource
    DataSet = cdsUPro
    Left = 59
    Top = 83
  end
  object cdsUPago: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvUPago'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 111
    Top = 70
  end
  object dsUPago: TwwDataSource
    DataSet = cdsUPago
    Left = 111
    Top = 83
  end
  object cdsTResol: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTResol'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 286
    Top = 588
  end
  object dsTResol: TwwDataSource
    DataSet = cdsTResol
    Left = 287
    Top = 601
  end
  object cdsTPension: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTPension'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 244
    Top = 70
  end
  object dsTPension: TwwDataSource
    DataSet = cdsTPension
    Left = 245
    Top = 83
  end
  object cdsTAso: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTAso'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 618
    Top = 133
  end
  object dsTAso: TwwDataSource
    DataSet = cdsTAso
    Left = 619
    Top = 146
  end
  object cdsSAso: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSAso'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 350
    Top = 70
  end
  object dsSAso: TwwDataSource
    DataSet = cdsSAso
    Left = 351
    Top = 83
  end
  object cdsCEdu: TwwClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'prvCEdu'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 397
    Top = 70
  end
  object dsCEdu: TwwDataSource
    DataSet = cdsCEdu
    Left = 397
    Top = 83
  end
  object cdsCAso: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCAso'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 539
    Top = 70
  end
  object dsCAso: TwwDataSource
    DataSet = cdsCAso
    Left = 539
    Top = 83
  end
  object cdsTUSE: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTUSE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 586
    Top = 70
  end
  object dsTUSE: TwwDataSource
    DataSet = cdsTUSE
    Left = 586
    Top = 83
  end
  object cdsOfDes: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvOfDes'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 490
    Top = 70
  end
  object dsOfDes: TwwDataSource
    DataSet = cdsOfDes
    Left = 490
    Top = 83
  end
  object cdsCViv: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCViv'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 441
    Top = 70
  end
  object dsCViv: TwwDataSource
    DataSet = cdsCViv
    Left = 441
    Top = 83
  end
  object cdsQry: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvQry'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 12
    Top = 133
  end
  object dsQry: TwwDataSource
    DataSet = cdsQry
    Left = 12
    Top = 146
  end
  object cdsDpto: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDpto'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 51
    Top = 133
  end
  object cdsTVia: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTVia'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 96
    Top = 133
    object cdsTViaTIPVIAID: TStringField
      DisplayLabel = 'ID'
      DisplayWidth = 2
      FieldName = 'TIPVIAID'
      Size = 2
    end
    object cdsTViaTIPVIADES: TStringField
      DisplayLabel = 'DESCRIPCION'
      DisplayWidth = 30
      FieldName = 'TIPVIADES'
      Size = 30
    end
  end
  object cdsDist: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDist'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 136
    Top = 133
  end
  object cdsTZona: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTZona'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 232
    Top = 133
  end
  object cdsTDoc: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTDoc'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 325
    Top = 133
  end
  object cdsUbigeo: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvUbigeo'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 374
    Top = 133
  end
  object cdsProvin: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvProvin'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 426
    Top = 133
  end
  object cdsEstCiv: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvEstCiv'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 476
    Top = 133
  end
  object cdsBcos: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvBcos'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 280
    Top = 133
  end
  object dsTDoc: TwwDataSource
    DataSet = cdsTDoc
    Left = 325
    Top = 146
  end
  object dsEstCiv: TwwDataSource
    DataSet = cdsEstCiv
    Left = 476
    Top = 146
  end
  object dsUbigeo: TwwDataSource
    DataSet = cdsUbigeo
    Left = 374
    Top = 146
  end
  object dsProvin: TwwDataSource
    DataSet = cdsProvin
    Left = 426
    Top = 146
  end
  object dsDpto: TwwDataSource
    DataSet = cdsDpto
    Left = 51
    Top = 146
  end
  object dsBcos: TwwDataSource
    DataSet = cdsBcos
    Left = 280
    Top = 146
  end
  object dsTVia: TwwDataSource
    DataSet = cdsTVia
    Left = 96
    Top = 146
  end
  object dsDist: TwwDataSource
    DataSet = cdsDist
    Left = 136
    Top = 146
  end
  object dsTZona: TwwDataSource
    DataSet = cdsTZona
    Left = 232
    Top = 146
  end
  object cdsPais: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvPais'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 60
    Top = 198
  end
  object dsPais: TwwDataSource
    DataSet = cdsPais
    Left = 60
    Top = 211
  end
  object cdsGradoI: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvGradoI'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 106
    Top = 198
  end
  object dsGradoI: TwwDataSource
    DataSet = cdsGradoI
    Left = 106
    Top = 211
  end
  object cdsGradoA: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvGradoA'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 159
    Top = 198
  end
  object dsGradoA: TwwDataSource
    DataSet = cdsGradoA
    Left = 159
    Top = 211
  end
  object cdsProf: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvProf'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 207
    Top = 198
  end
  object dsProf: TwwDataSource
    DataSet = cdsProf
    Left = 207
    Top = 211
  end
  object cdsTRela: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTRela'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 253
    Top = 198
  end
  object cdsCtasAso: TwwClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'prvCtasAso'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 363
    Top = 198
  end
  object dsCtasAso: TwwDataSource
    DataSet = cdsCtasAso
    Left = 363
    Top = 211
  end
  object cdsAportes: TwwClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'prvAportes'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 422
    Top = 198
  end
  object dsAportes: TwwDataSource
    DataSet = cdsAportes
    Left = 422
    Top = 211
  end
  object cdsSexo: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvQry'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 523
    Top = 133
  end
  object dsSexo: TwwDataSource
    DataSet = cdsSexo
    Left = 523
    Top = 146
  end
  object cdsLugNac: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvUbigeo'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 479
    Top = 198
  end
  object dsLugNac: TwwDataSource
    DataSet = cdsLugNac
    Left = 479
    Top = 211
  end
  object cdsTMoneda: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTMoneda'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 812
    Top = 198
  end
  object cdsRepresentante: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvRepresentante'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 142
    Top = 259
  end
  object cdsCuentas: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCuentas'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 15
    Top = 259
  end
  object dsCuentas: TwwDataSource
    DataSet = cdsCuentas
    Left = 15
    Top = 272
  end
  object dsTMoneda: TwwDataSource
    DataSet = cdsTMoneda
    Left = 813
    Top = 211
  end
  object dsRepresentante: TwwDataSource
    DataSet = cdsRepresentante
    Left = 142
    Top = 272
  end
  object cdsFPago: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvFPago'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 211
    Top = 259
  end
  object dsFPago: TwwDataSource
    DataSet = cdsFPago
    Left = 212
    Top = 272
  end
  object cdsDetRegCob: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDetRegCob'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 333
    Top = 259
  end
  object dsDetRegCob: TwwDataSource
    DataSet = cdsDetRegCob
    Left = 334
    Top = 272
  end
  object cdsRegCob: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvRegCob'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 265
    Top = 259
  end
  object cdsSitRepr: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSitRepr'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 397
    Top = 259
  end
  object cdsFRepr: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvFRepr'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 449
    Top = 259
  end
  object dsSitRepr: TwwDataSource
    DataSet = cdsSitRepr
    Left = 397
    Top = 272
  end
  object dsFRepr: TwwDataSource
    DataSet = cdsFRepr
    Left = 451
    Top = 272
  end
  object cdsRepresentante1: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvRepresentante'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 570
    Top = 259
  end
  object dsRepresentante1: TwwDataSource
    DataSet = cdsRepresentante1
    Left = 571
    Top = 272
  end
  object cdsSitCta: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSitCta'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 498
    Top = 259
  end
  object dsSitCta: TwwDataSource
    DataSet = cdsSitCta
    Left = 499
    Top = 272
  end
  object cdsFormaPago: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvFormaPago'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 546
    Top = 198
  end
  object dsFormaPago: TwwDataSource
    DataSet = cdsFormaPago
    Left = 546
    Top = 211
  end
  object cdsModelo: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspModelo'
    RemoteServer = DCOM1
    OnReconcileError = cdsEjecutaReconcileError
    ValidateWithMask = True
    Left = 15
    Top = 322
  end
  object cdsPlantilla: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPlantilla'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 69
    Top = 322
  end
  object cdsPlanDet: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPlanDet'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 125
    Top = 322
  end
  object dsModelo: TwwDataSource
    DataSet = cdsModelo
    Left = 15
    Top = 335
  end
  object dsPlantilla: TwwDataSource
    DataSet = cdsPlantilla
    Left = 69
    Top = 335
  end
  object dsPlandet: TwwDataSource
    DataSet = cdsPlanDet
    Left = 125
    Top = 335
  end
  object cdsDetalle: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAutdisk'
    RemoteServer = DCOM1
    OnReconcileError = cdsEjecutaReconcileError
    PictureMasks.Strings = (
      'MONTOTOT'#9'###,###,##0.00'#9'T'#9'F')
    ValidateWithMask = True
    Left = 241
    Top = 322
  end
  object dsDetalle: TwwDataSource
    DataSet = cdsDetalle
    Left = 241
    Top = 335
  end
  object cdsCambios: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 305
    Top = 322
  end
  object dsCambios: TwwDataSource
    DataSet = cdsCambios
    Left = 307
    Top = 335
  end
  object tbOrigen: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBajaAutDisk'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 714
    Top = 588
  end
  object ds1: TwwDataSource
    DataSet = tbOrigen
    Left = 476
    Top = 602
  end
  object cdsEstado: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 610
    Top = 9
  end
  object dsEstado: TwwDataSource
    DataSet = cdsEstado
    Left = 610
    Top = 22
  end
  object cdsConvenio: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvConvenio'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 642
    Top = 70
  end
  object dsConvenio: TwwDataSource
    DataSet = cdsConvenio
    Left = 642
    Top = 83
  end
  object cdsCuotas: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCuotas'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 571
    Top = 133
  end
  object dsCuotas: TwwDataSource
    DataSet = cdsCuotas
    Left = 571
    Top = 146
  end
  object cdsDcuotas: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCuotas'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 612
    Top = 198
  end
  object dsDcuotas: TwwDataSource
    DataSet = cdsDcuotas
    Left = 612
    Top = 211
  end
  object cdsCredito: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCreditos'
    RemoteServer = DCOM1
    OnReconcileError = cdsEjecutaReconcileError
    ValidateWithMask = True
    Left = 762
    Top = 70
  end
  object dsCredito: TwwDataSource
    DataSet = cdsCredito
    Left = 762
    Top = 83
  end
  object CdsCBcos: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCbcos'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 671
    Top = 198
  end
  object dsCBcos: TwwDataSource
    DataSet = CdsCBcos
    Left = 671
    Top = 211
  end
  object cdsReclamo: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvReclamoCob'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 669
    Top = 9
  end
  object dsReclamo: TwwDataSource
    DataSet = cdsReclamo
    Left = 670
    Top = 22
  end
  object cdsReclamoDCob: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvReclamoDCob'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 438
    Top = 322
  end
  object dsReclamoDCob: TwwDataSource
    DataSet = cdsReclamoDCob
    Left = 438
    Top = 335
  end
  object cdsTransacciones: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTransaccionCre'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 527
    Top = 322
  end
  object dstransacciones: TwwDataSource
    DataSet = cdsTransacciones
    Left = 529
    Top = 335
  end
  object cdsAsociados1: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvAso'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 653
    Top = 259
  end
  object dsAsociados1: TwwDataSource
    DataSet = cdsAsociados1
    Left = 653
    Top = 272
  end
  object cdsReclamoMotiv: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvReclMotivo'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 609
    Top = 322
  end
  object dsReclamoMotiv: TwwDataSource
    DataSet = cdsReclamoMotiv
    Left = 609
    Top = 335
  end
  object cdsTCredito: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTCredito'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 685
    Top = 322
  end
  object dsTcredito: TwwDataSource
    DataSet = cdsTCredito
    Left = 685
    Top = 335
  end
  object cdsReclamo1: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvReclamoCob'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 15
    Top = 387
  end
  object dsReclamo1: TwwDataSource
    DataSet = cdsReclamo1
    Left = 15
    Top = 400
  end
  object cdsAsoX: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvAso'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 68
    Top = 387
  end
  object dsAsoX: TwwDataSource
    DataSet = cdsAsoX
    Left = 67
    Top = 400
  end
  object cdsAsociados: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvAsociados'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 123
    Top = 387
  end
  object dsAsociados: TwwDataSource
    DataSet = cdsAsociados
    Left = 123
    Top = 400
  end
  object cdsDevolucionCob: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDevolucionCob'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 202
    Top = 387
  end
  object cdsTransDevol: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTransaccion'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 286
    Top = 387
  end
  object cdsAgenciaBco: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvAgenciaBco'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 401
    Top = 387
  end
  object dsAgenciaBco: TwwDataSource
    DataSet = cdsAgenciaBco
    Left = 401
    Top = 400
  end
  object cdsTmone: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTMoneda'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 466
    Top = 387
  end
  object dsTmone: TwwDataSource
    DataSet = cdsTmone
    Left = 466
    Top = 400
  end
  object cdsTtransaccion: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTtransaccion'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 534
    Top = 387
  end
  object cdsReporte: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvReporte'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 15
    Top = 456
  end
  object dsReporte: TwwDataSource
    DataSet = cdsReporte
    Left = 15
    Top = 469
  end
  object cdsATransp: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvAtransp'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 75
    Top = 456
  end
  object cdsRecauda: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvRecauda'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 363
    Top = 322
  end
  object cdsLiquid: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvLiquid'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 771
    Top = 387
  end
  object cdsPersRep: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvPersRep'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 202
    Top = 456
  end
  object dsATransp: TwwDataSource
    DataSet = cdsATransp
    Left = 75
    Top = 469
  end
  object dsRecauda: TwwDataSource
    DataSet = cdsRecauda
    Left = 363
    Top = 335
  end
  object dsLiquid: TwwDataSource
    DataSet = cdsLiquid
    Left = 771
    Top = 400
  end
  object dsPersRep: TwwDataSource
    DataSet = cdsPersRep
    Left = 202
    Top = 469
  end
  object cdsDetRegGlob: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDetRegGlob'
    RemoteServer = DCOM1
    PictureMasks.Strings = (
      'DOCMTO'#9'*12[#][.*2[#]]'#9'T'#9'F')
    ValidateWithMask = True
    Left = 614
    Top = 387
  end
  object dsDetRegGlob: TwwDataSource
    DataSet = cdsDetRegGlob
    Left = 614
    Top = 400
  end
  object cdsQry2: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 676
    Top = 387
  end
  object cdsCobxUse: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCobxUse'
    RemoteServer = DCOM1
    PictureMasks.Strings = (
      'RCOBAPOVAL'#9'*12[#][.*2[#]]'#9'T'#9'F')
    ValidateWithMask = True
    Left = 659
    Top = 520
  end
  object dsCobxUse: TwwDataSource
    AutoEdit = False
    DataSet = cdsCobxUse
    Left = 662
    Top = 534
  end
  object cdsReporte1: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvReporte1'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 410
    Top = 456
  end
  object dsReporte1: TwwDataSource
    DataSet = cdsReporte1
    Left = 411
    Top = 469
  end
  object cdsAutdisk: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAutdisk'
    RemoteServer = DCOM1
    OnReconcileError = cdsEjecutaReconcileError
    ControlType.Strings = (
      'FREGCOB;CheckBox;S;N')
    ValidateWithMask = True
    Left = 742
    Top = 322
  end
  object cdsTransferencia: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvAportes'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 729
    Top = 259
  end
  object dsTransferencia: TwwDataSource
    AutoEdit = False
    DataSet = cdsTransferencia
    Left = 729
    Top = 272
  end
  object cdsCtaCtes: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCtaCtes'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 778
    Top = 520
  end
  object cdsPeriodo: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvPeriodo'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 306
    Top = 198
  end
  object dsPeriodo: TwwDataSource
    DataSet = cdsPeriodo
    Left = 307
    Top = 211
  end
  object cdsBancos: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBancos'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 821
    Top = 387
  end
  object dsBancos: TwwDataSource
    DataSet = cdsBancos
    Left = 822
    Top = 400
  end
  object cdsTRecauda: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTRecauda'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 467
    Top = 521
  end
  object dsTRecauda: TwwDataSource
    DataSet = cdsPadre
    Left = 467
    Top = 534
  end
  object cdsCuentaEst: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCuentaEst'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 385
    Top = 9
  end
  object dsCuentaEst: TwwDataSource
    DataSet = cdsCuentaEst
    Left = 385
    Top = 22
  end
  object cdsPadre: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvPadre'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 824
    Top = 9
  end
  object dsPadre: TwwDataSource
    DataSet = cdsPadre
    Left = 824
    Top = 22
  end
  object cdsHijo: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvHijo'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 779
    Top = 9
  end
  object dsHijo: TwwDataSource
    DataSet = cdsHijo
    Left = 779
    Top = 22
  end
  object cdsNieto: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvNieto'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 812
    Top = 70
  end
  object dsNieto: TwwDataSource
    DataSet = cdsNieto
    Left = 812
    Top = 83
  end
  object cdsDevolucion: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDevolucion'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 807
    Top = 322
  end
  object cdsCia: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCia'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 526
    Top = 588
  end
  object cdsSQL: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 629
    Top = 588
  end
  object cdsRTransporte: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCuotas'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 735
    Top = 198
  end
  object dsRTransporte: TwwDataSource
    DataSet = cdsRTransporte
    Left = 735
    Top = 211
  end
  object cdsTransporte: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvReclamoDCob'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 780
    Top = 456
  end
  object dsTransporte: TwwDataSource
    DataSet = cdsTransporte
    Left = 780
    Top = 469
  end
  object cdsRRepresentante: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvReclamoCob'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 786
    Top = 588
  end
  object dsRRepresentante: TwwDataSource
    DataSet = cdsRRepresentante
    Left = 786
    Top = 601
  end
  object wwDataSource1: TwwDataSource
    DataSet = cdsSQL
    Left = 526
    Top = 601
  end
  object cdsCCosto: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTransaccionCre'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 542
    Top = 456
  end
  object dsCCosto: TwwDataSource
    DataSet = cdsCCosto
    Left = 542
    Top = 469
  end
  object cdsBoletaDCob: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDetRegGlob'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 191
    Top = 322
  end
  object dsBoletaDCob: TwwDataSource
    DataSet = cdsBoletaDCob
    Left = 191
    Top = 335
  end
  object cdsBoletaCob: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCuotas'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 398
    Top = 521
  end
  object dsBoletaCob: TwwDataSource
    DataSet = cdsBoletaCob
    Left = 398
    Top = 534
  end
  object cdsconcepto: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvQry'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 88
    Top = 588
  end
  object dsconcepto: TwwDataSource
    DataSet = cdsconcepto
    Left = 85
    Top = 601
  end
  object cdsTipBoleta: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvAbonoCreditos'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 673
    Top = 133
  end
  object dsTipBoleta: TwwDataSource
    DataSet = cdsTipBoleta
    Left = 673
    Top = 146
  end
  object cdsReprCtaCte: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvReclamoDCre'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 478
    Top = 456
  end
  object dsReprCtaCte: TwwDataSource
    DataSet = cdsReprCtaCte
    Left = 478
    Top = 469
  end
  object cdssitreclamo: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSitReclamo'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 152
    Top = 588
  end
  object dssitreclamo: TwwDataSource
    DataSet = cdssitreclamo
    Left = 153
    Top = 601
  end
  object cdsQry3: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvReporte'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 723
    Top = 9
  end
  object cdsQry4: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 835
    Top = 456
  end
  object dsQry3: TwwDataSource
    DataSet = cdsQry3
    Left = 723
    Top = 22
  end
  object dsQry4: TwwDataSource
    DataSet = cdsQry4
    Left = 835
    Top = 469
  end
  object cdsQry1: TwwClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    Params = <>
    ProviderName = 'prvQry'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 525
    Top = 521
  end
  object cdsSolicitudes: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvQry'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 225
    Top = 588
  end
  object dsSolicitudes: TwwDataSource
    DataSet = cdsSolicitudes
    Left = 227
    Top = 601
  end
  object cdsListaCred: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvQry'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 67
    Top = 259
  end
  object dsListaCred: TwwDataSource
    DataSet = cdsListaCred
    Left = 67
    Top = 272
  end
  object cdsSolicitudA: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvQry'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 350
    Top = 588
  end
  object cdsSolicitud: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvQry'
    RemoteServer = DCOM1
    OnReconcileError = cdsEjecutaReconcileError
    ValidateWithMask = True
    Left = 735
    Top = 133
  end
  object cdsConcre: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvQry'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 723
    Top = 520
  end
  object dsConcre: TwwDataSource
    DataSet = cdsConcre
    Left = 724
    Top = 534
  end
  object cdsListaCreA: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvQry'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 802
    Top = 259
  end
  object dsListaCreA: TwwDataSource
    DataSet = cdsListaCreA
    Left = 802
    Top = 272
  end
  object cdsTipCreA: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvQry'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 793
    Top = 133
  end
  object dsTipCreA: TwwDataSource
    DataSet = cdsTipCreA
    Left = 794
    Top = 146
  end
  object cdsRelCapCuo: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvQry'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 176
    Top = 70
  end
  object dsRelCapCuo: TwwDataSource
    DataSet = cdsRelCapCuo
    Left = 175
    Top = 83
  end
  object cdsCompromiso: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 79
    Top = 521
  end
  object dsCompromiso: TwwDataSource
    DataSet = cdsCompromiso
    Left = 79
    Top = 534
  end
  object cdsConsulta: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvQry'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 706
    Top = 70
  end
  object dsConsulta: TwwDataSource
    DataSet = cdsConsulta
    Left = 706
    Top = 83
  end
  object cdsParam: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvQry'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 297
    Top = 70
  end
  object dsParam: TwwDataSource
    DataSet = cdsParam
    Left = 297
    Top = 83
  end
  object cdsCob336: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvQry'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 652
    Top = 456
  end
  object dsCob336: TwwDataSource
    DataSet = cdsCob336
    Left = 653
    Top = 469
  end
  object cdsSobrino: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSobrino'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 179
    Top = 133
  end
  object dsSobrino: TwwDataSource
    DataSet = cdsSobrino
    Left = 179
    Top = 146
  end
  object cdsQry5: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTem7'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 341
    Top = 387
  end
  object dsqry5: TwwDataSource
    DataSet = cdsQry5
    Left = 341
    Top = 400
  end
  object cdsResultSet: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ValidateWithMask = True
    Left = 473
    Top = 588
  end
  object cdsMovCre: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCreditoCab'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 595
    Top = 456
  end
  object dsMovCre: TwwDataSource
    DataSet = cdsMovCre
    Left = 595
    Top = 469
  end
  object cdsAbonoCuotas: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvAbonoCuotas'
    RemoteServer = DCOM1
    OnReconcileError = cdsEjecutaReconcileError
    ValidateWithMask = True
    Left = 587
    Top = 521
  end
  object dsAbonoCuotas: TwwDataSource
    DataSet = cdsAbonoCuotas
    Left = 587
    Top = 534
  end
  object cdsUser: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvUser'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 720
    Top = 387
  end
  object cdsBancoEgr: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 21
    Top = 588
  end
  object cdsCCBco: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 15
    Top = 521
  end
  object dsCCBco: TwwDataSource
    DataSet = cdsCCBco
    Left = 15
    Top = 534
  end
  object cdsFormPago: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 138
    Top = 456
  end
  object dsFormPago: TwwDataSource
    DataSet = cdsFormPago
    Left = 141
    Top = 469
  end
  object cdsRec: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 252
    Top = 456
  end
  object dsRec: TwwDataSource
    DataSet = cdsRec
    Left = 252
    Top = 469
  end
  object cdsClaseAux: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 577
    Top = 588
  end
  object cdsAux: TwwClientDataSet
    Aggregates = <>
    PacketRecords = 25
    Params = <>
    ProviderName = 'dspQry'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 673
    Top = 588
  end
  object cdsTMon: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 296
    Top = 456
  end
  object dsTMon: TwwDataSource
    DataSet = cdsTMon
    Left = 297
    Top = 469
  end
  object cdsProvCta: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 349
    Top = 456
  end
  object dsProvCta: TwwDataSource
    DataSet = cdsProvCta
    Left = 350
    Top = 469
  end
  object cdsEquiv: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 220
    Top = 521
  end
  object dsEquiv: TwwDataSource
    DataSet = cdsEquiv
    Left = 222
    Top = 534
  end
  object cdsCnpEgr: TwwClientDataSet
    Aggregates = <>
    IndexFieldNames = 'CPTOID'
    Params = <>
    ProviderName = 'dspQry'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 273
    Top = 521
  end
  object dsCnpEgr: TwwDataSource
    DataSet = cdsCnpEgr
    Left = 275
    Top = 534
  end
  object cdsFEfec: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 416
    Top = 588
  end
  object cdsMovRec: TwwClientDataSet
    Aggregates = <>
    PacketRecords = 10
    Params = <>
    ProviderName = 'dspQry'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 329
    Top = 521
  end
  object dsMovRec: TwwDataSource
    DataSet = cdsMovRec
    Left = 331
    Top = 534
  end
  object cdsDocPago: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry'
    RemoteServer = DCOM1
    OnReconcileError = cdsEjecutaReconcileError
    ControlType.Strings = (
      'TMONID;CustomEdit;dblcMoneda'
      'DETCPAG;CustomEdit;dbeTC'
      'DEMTOLOC;CustomEdit;dbeMPL'
      'DEMTOEXT;CustomEdit;dbeMPE')
    ValidateWithMask = True
    Left = 713
    Top = 456
  end
  object dsDocPago: TwwDataSource
    DataSet = cdsDocPago
    Left = 714
    Top = 469
  end
  object cdsDetRegCob1: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDetRegCob'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 159
    Top = 521
  end
  object dsDetRegCob1: TwwDataSource
    DataSet = cdsDetRegCob1
    Left = 159
    Top = 534
  end
  object dsQry1: TwwDataSource
    DataSet = cdsQry1
    Left = 525
    Top = 534
  end
  object dsTtransaccion: TwwDataSource
    DataSet = cdsTtransaccion
    Left = 534
    Top = 400
  end
  object dsDevolucionCob: TwwDataSource
    DataSet = cdsDevolucionCob
    Left = 202
    Top = 400
  end
  object dsTransDevol: TwwDataSource
    DataSet = cdsTransDevol
    Left = 286
    Top = 400
  end
  object dsQry2: TwwDataSource
    AutoEdit = False
    DataSet = cdsQry2
    Left = 676
    Top = 400
  end
  object dsUser: TwwDataSource
    DataSet = cdsUser
    Left = 720
    Top = 400
  end
  object dsSolicitud: TwwDataSource
    DataSet = cdsSolicitud
    Left = 736
    Top = 146
  end
  object dsTRela: TwwDataSource
    DataSet = cdsTRela
    Left = 253
    Top = 211
  end
  object dsRegCob: TwwDataSource
    DataSet = cdsRegCob
    Left = 266
    Top = 272
  end
  object dsAutdisk: TwwDataSource
    DataSet = cdsAutdisk
    Left = 742
    Top = 335
  end
  object dsDevolucion: TwwDataSource
    DataSet = cdsDevolucion
    Left = 808
    Top = 335
  end
  object dsCtaCtes: TwwDataSource
    DataSet = cdsCtaCtes
    Left = 779
    Top = 534
  end
  object dsSolicitudA: TwwDataSource
    DataSet = cdsSolicitudA
    Left = 351
    Top = 601
  end
  object MainMenu1: TMainMenu
    Left = 123
    Top = 80
  end
  object ExcelApp: TExcelApplication
    AutoConnect = False
    ConnectKind = ckNewInstance
    AutoQuit = False
    Left = 810
    Top = 501
  end
  object ExcelBook: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 814
    Top = 517
  end
  object WS: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 818
    Top = 541
  end
  object cdsQry6: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 843
    Top = 128
  end
  object dsQry6: TwwDataSource
    DataSet = cdsQry6
    Left = 843
    Top = 141
  end
  object cdsMovCnt1: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCreditos'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 867
    Top = 322
  end
  object dsMovCnt1: TwwDataSource
    DataSet = cdsMovCnt1
    Left = 867
    Top = 335
  end
  object cdsTipDesem: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 867
    Top = 261
  end
  object dsTipdesem: TwwDataSource
    DataSet = cdsTipDesem
    Left = 867
    Top = 274
  end
  object cdsQry22: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 939
    Top = 80
  end
  object dsQry22: TwwDataSource
    DataSet = cdsQry22
    Left = 939
    Top = 93
  end
  object cdsQry23: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 939
    Top = 152
  end
  object dsQry23: TwwDataSource
    DataSet = cdsQry23
    Left = 939
    Top = 165
  end
  object cdsQry24: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 1035
    Top = 152
  end
  object dsQry24: TwwDataSource
    DataSet = cdsQry24
    Left = 1035
    Top = 165
  end
  object cdsQry25: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspQry'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 1035
    Top = 280
  end
  object dsQry25: TwwDataSource
    DataSet = cdsQry25
    Left = 1035
    Top = 293
  end
end
