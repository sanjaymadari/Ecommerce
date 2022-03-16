
using Dapper;
using Ecommerce.DTOs;
using Ecommerce.Models;
using Ecommerce.Utilities;

namespace Ecommerce.Repositories;


public interface IOrderRepository
{
    Task<List<Order>> GetList();
    Task<Order> GetById(long Id);
    Task<Order> Create(Order Data);
    Task<Order> Update(Order Data);
    Task<List<Order>> GetOrderForCustomer(long CustomerId);
    Task Delete(long Id);
}
public class OrderRepository : BaseRepository, IOrderRepository
{
    public OrderRepository(IConfiguration configuration) : base(configuration)
    {

    }

    public async Task<Order> Create(Order Data)
    {
        var query = $@"INSERT INTO {TableNames.orders}(customer_id, ordered_at, total_price, mode_of_payment)
	    VALUES (@CustomerId, @OrderedAt, @TotalPrice, @ModeOfPayment) RETURNING *";
        
        using (var con = NewConnection)
            return await con.QuerySingleOrDefaultAsync<Order>(query, Data);
    }

    public async Task Delete(long Id)
    {
        var query = $@"DELETE FROM ""{TableNames.orders}"" WHERE id = @Id;";
        using (var con = NewConnection)
            await con.ExecuteAsync(query, new { Id });
    }

    public async Task<Order> GetById(long Id)
    {
        var query = $@"SELECT * FROM {TableNames.orders} WHERE id = @Id";
        using (var con = NewConnection)
            return await con.QuerySingleOrDefaultAsync<Order>(query, new { Id });
    }

    public async Task<List<Order>> GetList()
    {
        var query = $@"SELECT * FROM {TableNames.orders} ORDER BY id";
        using (var con = NewConnection)
            return (await con.QueryAsync<Order>(query)).AsList();
    }

    public async Task<List<Order>> GetOrderForCustomer(long CustomerId)
    {
        var query = $@"SELECT * FROM {TableNames.orders} WHERE customer_id = @CustomerId";
        using (var con = NewConnection)
            return (await con.QueryAsync<Order>(query, new { CustomerId })).AsList();
    }

    public Task<Order> Update(Order Data)
    {
        throw new NotImplementedException();
    }
}
