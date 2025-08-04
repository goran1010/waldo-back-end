import { Router } from "express";
const apiRouter = Router();
import * as apiController from "../controllers/apiController.js";

apiRouter.post("/users", apiController.createUser);

apiRouter.put("/users/:userId", apiController.updateSolution);

apiRouter.put("/solutions", apiController.getScore);

export default apiRouter;
