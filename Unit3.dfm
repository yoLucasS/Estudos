object DataModule3: TDataModule3
  Height = 291
  Width = 361
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=PG'
      'User_Name=postgres')
    LoginPrompt = False
    Left = 72
    Top = 56
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files\PostgreSQL\15\lib\libpq.dll'
    Left = 192
    Top = 64
  end
end
