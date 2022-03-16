
using Ecommerce.DTOs;
using Ecommerce.Models;
using Ecommerce.Repositories;
using Microsoft.AspNetCore.Mvc;

namespace Ecommerce.Controllers;

[ApiController]
[Route("api/tags")]
public class TagsController : ControllerBase
{
    private readonly ILogger<TagsController> _logger;
    private readonly ITagsRepository _tags;
    public TagsController(ILogger<TagsController> logger, ITagsRepository tags)
    {
        _logger = logger;
        _tags = tags;
    }

    [HttpGet]
    public async Task<ActionResult<List<TagsDTO>>> GetList()
    {
        var tagList = (await _tags.GetList()).Select(x => x.asDto);
        return Ok(tagList);
    }


    [HttpGet("{id}")]
    public async Task<ActionResult<TagsDTO>> GetById([FromRoute] long id)
    {
        var tags = (await _tags.GetById(id));
        if(tags == null) return NotFound("Tags does not exist");
        var res = tags.asDto;
        return Ok(res);
    }


    [HttpPost]
    public async Task<ActionResult<TagsDTO>> Create([FromBody] TagsCreateDTO Data)
    {
        var createTags = new Tags
        {
            Brand = Data.Brand,
            Color = Data.Color,
            Model = Data.Model,
            ProductId = Data.ProductId,
        };
        var createdTags = await _tags.Create(createTags);
        return StatusCode(StatusCodes.Status201Created, createdTags);
    }

}

