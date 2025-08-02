import { Router } from "express";
const apiRouter = Router();
import * as apiController from "../controllers/apiController.js";

apiRouter.post("/users", apiController.createUser);

apiRouter.put("/users/:userId", apiController.updateSolution);

export default apiRouter;
