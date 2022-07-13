unit View;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  View.Controller, ViewModel, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TMainForm = class(TForm)
    ControllerFrame1: TControllerFrame;
  private
    FViewModel: TViewModel;
  public
    constructor Create(AOwner: TComponent); override;
  end;

const ModelDataPrefix = 'ModelData';

var
  MainForm: TMainForm;


implementation

{$R *.fmx}

constructor TMainForm.Create(AOwner: TComponent);
begin
  inherited;
  FViewModel := TViewModel.Create;
  for var i: Integer := 0 to Length(ControllerFrame1.EnumAtoms) - 1 do
  begin
    ControllerFrame1.EnumAtoms[i].SetImage(FViewModel.GetModelImages[i]);
    ControllerFrame1.EnumAtoms[i].SetName(Concat(ModelDataPrefix, i.ToString))
  end;
end;

end.
