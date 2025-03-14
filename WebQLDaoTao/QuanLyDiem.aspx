<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QuanLyDiem.aspx.cs" Inherits="WebQLDaoTao.QuanLyDiem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h2>QUẢN LÝ ĐIỂM THI</h2>
    <hr />

    <asp:ObjectDataSource runat="server" ID="odsDiem" DataObjectTypeName="WebQLDaoTao.Models.Score" DeleteMethod="Delete"
        SelectMethod="GetByMaMH" TypeName="WebQLDaoTao.Models.ScoreDao" UpdateMethod="Update">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlMonHoc" DefaultValue="mamh" Name="mamh" PropertyName="SelectedValue"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource runat="server" ID="odsMonHoc" SelectMethod="GetAll" TypeName="WebQLDaoTao.Models.MonHocDAO"></asp:ObjectDataSource>
    <asp:ScriptManager ID="SM1" runat="server"></asp:ScriptManager>
    <<asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="form-horizontal">
                <div class="form-group">
                    <label class="control-label col-sm-2">Chọn môn học</label>
                    <div class="col-md-2">
                        <asp:DropDownList ID="ddlMonHoc" AutoPostBack="True" runat="server" CssClass="form-control"
                            DataSourceID="odsMonHoc" DataTextField="TenMH" DataValueField="MaMH" Width="300px">
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <hr />
            <asp:GridView ID="gvKetQua" runat="server"
                AutoGenerateColumns="False" CssClass="table table-bordered" Width="75%" DataSourceID="odsDiem" DataKeyNames="ID"
                AllowPaging="true" PageSize="6" ShowFooter="true">
                <Columns>
                    <asp:BoundField DataField="MaSV" HeaderText="Mã SV" SortExpression="MaSV" ItemStyle-Width="70px" HeaderStyle-CssClass="text-center">
                        <ItemStyle Width="70px" HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="HoTenSV" HeaderText="Họ tên" HeaderStyle-CssClass="text-center" SortExpression="HoTenSV" ItemStyle-Width="300px">
                        <ItemStyle Width="300px"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Điểm" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:TextBox runat="server" ID="txtDiem" Text='<%# Eval("Diem") %>' Width="50px"></asp:TextBox>
                        </ItemTemplate>
                        <FooterTemplate>
                            <div style="text-align: center">
                                <asp:Button ID="btnLuu" runat="server" CssClass="btn btn-success" Text="Lưu điểm" OnClick="btnLuu_Click" />
                            </div>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Chọn xóa" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center" ItemStyle-Width="250px">
                        <ItemTemplate>
                            <asp:CheckBox runat="server" ID="cbxChon" />
                        </ItemTemplate>
                        <FooterTemplate>
                            <div style="text-align: center">
                                <asp:Button ID="btnSelectAll" runat="server" CssClass="btn btn-primary " Text="Chọn tất cả" OnClick="btnSelectAll_Click" Width="100px" />
                                <asp:Button ID="btnXoa" runat="server" CssClass="btn btn-danger" Text="Xóa"
                                    OnClientClick="return confirm('Bạn có chắc muốn xóa hết điểm đã chọn?')" OnClick="btnXoa_Click" Width="100px" />
                            </div>
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                <PagerStyle BorderColor="#3366CC" BorderStyle="Solid" BorderWidth="1px" Font-Size="Large" HorizontalAlign="Center"
                    VerticalAlign="Middle" CssClass="paging" />
                <EmptyDataTemplate>
                    <div style="text-align: center; font-weight: bold; color: red">Không có dữ liệu</div>
                </EmptyDataTemplate>
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>



    <asp:Label ID="lbThongBaoXoa" runat="server" Text="" Font-Size="Medium"></asp:Label>
</asp:Content>
