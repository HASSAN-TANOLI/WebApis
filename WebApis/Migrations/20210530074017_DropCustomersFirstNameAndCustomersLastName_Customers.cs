using Microsoft.EntityFrameworkCore.Migrations;

namespace WebApis.Migrations
{
    public partial class DropCustomersFirstNameAndCustomersLastName_Customers : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {

            //Revert Migration 

            migrationBuilder.AddColumn<string>(
                name: "CustomersFullName",
                table: "Customers",
                nullable: true);

            migrationBuilder.Sql(@"update Customers set CustomersFullName = CustomersFirstName + ' : ' +CustomersLastName");

            migrationBuilder.DropColumn(
                name: "CustomersFirstName",
                table: "Customers");

            migrationBuilder.DropColumn(
                name: "CustomersLastName",
                table: "Customers");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {

            migrationBuilder.RenameColumn(
                name: "CustomersFullName",
                table: "Customers",
                newName: "CustomersLastName");

            migrationBuilder.AddColumn<string>(
                name: "CustomersFirstName",
                table: "Customers",
                nullable: true);
        }
    }
}
