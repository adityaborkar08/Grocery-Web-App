const app = require("../server.js"); // Link to your server file
const supertest = require("supertest");
const request = supertest(app);
const port = 1000;

describe("API Endpoints", () => {
  it("Checking the brand id exists or no", async () => {
    await supertest(app)
      .get("/admin/brands/")
      .then((response) => {
        expect(response.body[0].brand_id).toBe(1);
      });
  });

  it("User details with user ID 1", async () => {
    await supertest(app)
      .get("/user/details/1")
      .then((response) => {
        expect(response.body[0].city).toBe("Mannheim");
      });
  });

  it("To check product count using pagination", async () => {
    await supertest(app)
      .get("/admin/products/1")
      .then((response) => {
        let prods = response.body;
        expect(prods.products_page_count).toBeLessThanOrEqual(10);
      });
  });

  it("To check the number of categories", async () => {
    await supertest(app)
      .get("")
      .then((response) => {
        let prods = response.body;
        expect(prods.length).toBeGreaterThanOrEqual(26);
      });
  });

  it("To check product exists or no", async () => {
    await supertest(app)
      .get("/admin/products/1")
      .then((response) => {
        let prods = response.body;
        expect(prods.products[0].product_name).toContain("Chilli");
      });
  });

  it("To check the number of categories", async () => {
    await supertest(app)
      .get("/admin/category")
      .then((response) => {
        let prods = response.body;
        expect(prods.length).toBe(4);
      });
  });

  it("To check the type of categories", async () => {
    await supertest(app)
      .get("/admin/category")
      .then((response) => {
        let prods = response.body;
        console.log(prods);
        expect(prods[0].category_name).toEqual("vegetable");
      });
  });

  it("To check the number of Brands", async () => {
    await supertest(app)
      .get("/admin/brands")
      .then((response) => {
        let prods = response.body;
        expect(prods.length).toBe(2);
      });
  });

  it("To check the type of Brands", async () => {
    await supertest(app)
      .get("/admin/brands")
      .then((response) => {
        let prods = response.body;
        expect(prods[0].brand_name).toEqual("loose vegetable");
        expect(prods[1].brand_name).toEqual("TRS");
      });
  });

  it("To check the order with ID exists or no", async () => {
    await supertest(app)
      .get("/user/orders/1/1")
      .then((response) => {
        expect(response.req).toBeDefined();
      });
  });
});

app.listen(port);
