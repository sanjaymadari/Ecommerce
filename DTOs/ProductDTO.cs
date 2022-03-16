

using System.Text.Json.Serialization;

namespace Ecommerce.DTOs;

public record ProductDTO
{

    [JsonPropertyName("id")]
    public long Id { get; set; }

    [JsonPropertyName("name")]
    public string Name { get; set; }

    [JsonPropertyName("price")]
    public decimal Price { get; set; }

    [JsonPropertyName("tags")]
    public List<TagsDTO> Tags { get; set;}

}
public record ProductCreateDTO
{

    [JsonPropertyName("name")]
    public string Name { get; set; }

    [JsonPropertyName("price")]
    public decimal Price { get; set; }
}

public record ProductUpdateDTO
{

    [JsonPropertyName("price")]
    public decimal Price { get; set; }
}