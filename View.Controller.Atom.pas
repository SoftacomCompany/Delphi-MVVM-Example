unit View.Controller.Atom;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Objects, FMX.Controls.Presentation;

type
  TAtomFrame = class(TFrame)
    GridPanelLayout1: TGridPanelLayout;
    BgRect: TRectangle;
    Caption: TLabel;
    Image: TImage;
  private
    { Private declarations }
  public
    procedure SetName(AName: string);
    procedure SetImage(ABitmap: TBitmap);
  end;

implementation

{$R *.fmx}

{ TAtomFrame }

procedure TAtomFrame.SetImage(ABitmap: TBitmap);
begin
  if Assigned(ABitmap) then
    Image.Bitmap.Assign(ABitmap);
end;

procedure TAtomFrame.SetName(AName: string);
begin
  if not AName.IsEmpty then
    Caption.Text := AName;
end;

end.
